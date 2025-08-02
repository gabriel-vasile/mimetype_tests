package main

import (
	"encoding/json"
	"fmt"
	"log"
	"mime"
	"os"
	"os/exec"
	"path/filepath"
	"slices"
	"sort"
	"strings"
	"sync"
	"time"

	"github.com/gabriel-vasile/mimetype"
)

// This code is a mess, but it works well enough.
// How to run:
// DEBUG=1 will enable verbose logging: all wrong detections are logged
// and tallied at afterwards: DEBUG=1 go run main.go

// go run main.go # will compare mimetype to file
// go run main.go persist # will compare mimetype to file and persist the results on disk
// go run main.go compare # will compare mimetype to file and compare current run with the one persisted on disk

const (
	statusBad         = "bad"
	statusGood        = "good"
	statusUnsupported = "unsupported"

	threads = 4
)

var debug = os.Getenv("DEBUG") != ""

func main() {
	fmt.Println("=================================")
	fmt.Println("How to read the output of script:")
	fmt.Println(red("Red mimetypes ") + "are our own mimetypes when we identified the files wrong")
	fmt.Println(green("Green mimetypes ") + "are the correct mimetypes as identified by file --mime")
	fmt.Println("=================================\n")
	start := time.Now()
	fs := allFilesInDir("testfiles")
	mimetype.SetLimit(0)

	results := []Result{}
	wg := sync.WaitGroup{}
	mu := &sync.Mutex{}
	for s := range slices.Chunk(fs, len(fs)/threads) {
		wg.Add(1)
		go func() {
			defer wg.Done()
			for _, f := range s {
				m, err := mimetype.DetectFile(f)
				if err != nil {
					log.Fatal(err)
				}

				mag := mag(f)
				mag, _, _ = mime.ParseMediaType(mag)
				if skipFile(mag, m.String()) {
					continue
				}
				status := statusGood
				if !m.Is(mag) {
					if debug {
						fmt.Printf("filepth:%s\nguessed:%s\ncorrect:%s\n\n",
							f,
							red(fmt.Sprintf("%s", m)),
							green(mag),
						)
					}
					status = statusBad
				}
				mu.Lock()
				results = append(results, Result{
					File:     f,
					Status:   status,
					Mimetype: m.String(),
					Magic:    mag,
				})
				mu.Unlock()
			}
		}()
	}
	wg.Wait()
	tallyResults(results)
	fmt.Println("Runtime: ", time.Now().Sub(start))
	fmt.Printf("curr run: %v\n", statistic(results))

	if len(os.Args) > 1 && os.Args[1] == "persist" {
		fmt.Println("persisting")
		f, err := os.OpenFile("results.json", os.O_WRONLY|os.O_CREATE|os.O_TRUNC, os.ModePerm)
		if err != nil {
			panic(err)
		}

		enc := json.NewEncoder(f)
		enc.SetIndent("", "    ")
		if err := enc.Encode(results); err != nil {
			panic(err)
		}
	}

	if len(os.Args) > 1 && os.Args[1] == "compare" {
		fmt.Println("comparing")
		f, err := os.Open("results.json")
		if err != nil {
			panic(err)
		}
		res := []Result{}
		if err := json.NewDecoder(f).Decode(&res); err != nil {
			panic(err)
		}
		compareResults(res, results)
	}
}

func skipFile(mag, m string) bool {
	mea := mimetype.EqualsAny
	// If even file cannot detect, then skip.
	return mea(mag, "application/octet-stream") ||
		// inode/x-empty is for directories, skip.
		mea(mag, "inode/x-empty") ||
		// magic cannot detect text/vtt and we can, skip.
		(mea(m, "text/vtt") && mea(mag, "text/plain")) ||
		(mea(m, "application/x-subrip") && mea(mag, "text/plain"))
}

// mag calls the magic detection.
func mag(f string) string {
	out, err := exec.Command("file", "-b", "--mime", f).Output()
	if err != nil {
		panic(err)
	}
	return string(out)
}

func compareResults(old, curr []Result) {
	fmt.Printf("results.json has %d, current run has %d\n", len(old), len(curr))
	fmt.Printf("old results.json: %v\n", statistic(old))
	fmt.Printf("        curr run: %v\n", statistic(curr))
}

func statistic(rs []Result) string {
	stats := map[string]int{}
	for _, r := range rs {
		stats[r.Status]++
	}

	return fmt.Sprintf(`
totalFiles: %d
identified: %d
misIdentified: %d
unsupported: %d

identifiedPercent: %.2f`,
		len(rs),
		stats[statusGood],
		stats[statusBad],
		stats[statusUnsupported],

		percent(float64(stats[statusGood]), float64(len(rs))),
	)
}

// percent return x is what percent of y.
func percent(x, y float64) float64 {
	return x * 100 / y
}

// tallyResults func prints the most misidentified mime types.
func tallyResults(r1 []Result) any {
	fmt.Println("Tallying results to see which file formats were most misidentified...")
	type misIdentified struct {
		count         int
		misIdentified map[string]int
	}
	baddies := map[string]misIdentified{}
	for _, r := range r1 {
		if r.Status != statusGood {
			baddie := baddies[r.Magic]
			baddie.count++
			if baddie.misIdentified == nil {
				baddie.misIdentified = map[string]int{}
			}
			baddie.misIdentified[r.Mimetype]++
			baddies[r.Magic] = baddie
		}
	}

	baddiesStruct := []struct {
		magic         string
		count         int
		misIdentified map[string]int
	}{}
	for k, v := range baddies {
		baddiesStruct = append(baddiesStruct, struct {
			magic         string
			count         int
			misIdentified map[string]int
		}{k, v.count, v.misIdentified})
	}

	sort.Slice(baddiesStruct, func(i, j int) bool {
		return baddiesStruct[i].count > baddiesStruct[j].count
	})
	for _, b := range baddiesStruct {
		fmt.Printf(`
%s was misidentified %d times as:
%s
`, green(b.magic), b.count, red(fmt.Sprintf("%v", b.misIdentified)))
	}
	return baddiesStruct
}

func red(s string) string {
	return fmt.Sprintf("\033[31m" + s + "\033[0m")
}
func green(s string) string {
	return fmt.Sprintf("\033[32m" + s + "\033[0m")
}

func allFilesInDir(dir string) []string {
	ret := []string{}
	err := filepath.Walk(dir,
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if strings.HasSuffix(path, ".java") {
				return nil
			}
			if strings.Contains(path, "/.git/") {
				return nil
			}
			if info.Mode().IsRegular() {
				ret = append(ret, path)
			}
			return nil
		})
	if err != nil {
		log.Fatal(err)
	}
	return ret
}

type Result struct {
	File     string
	Status   string
	Mimetype string
	Magic    string
}
