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

	"github.com/gabriel-vasile/mimetype"
)

// This code is a mess, but it works well enough.
// How to run:
// DEBUG=1 will enable verbose logging: all wrong detections are logged
// and tallied afterwards: DEBUG=1 go run main.go

// go run main.go # will compare mimetype to file
// go run main.go persist # will additionally persist the results on disk as json

const (
	statusBad  = "bad"
	statusGood = "good"

	threads = 4
)

var debug = os.Getenv("DEBUG") != ""

func main() {
	fmt.Println(`
This script will iterate over the samples from testfiles dir and call mimetype
and file --mime utility. When mimetype and file disagree on what format a sample
should be it will get logged if DEBUG=1. After all samples have been compared,
the results are tallied and printed sorted by which file formats have been most
wrongfully identified. At the very end, statistics are printed as a percentage.

Expect this script to take a few minutes to run.
Call with "DEBUG=1 go run main.go" if you want to see more logging.`)
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
				skip, result := compareFile(f)
				if skip {
					continue
				}
				mu.Lock()
				results = append(results, result)
				mu.Unlock()
			}
		}()
	}
	wg.Wait()
	tallyResults(results)
	fmt.Printf("curr run: %v\n", statistic(results))

	if len(os.Args) > 1 && os.Args[1] == "persist" {
		fmt.Println("persisting")
		f, err := os.OpenFile("results.json", os.O_WRONLY|os.O_CREATE|os.O_TRUNC, os.ModePerm)
		if err != nil {
			log.Fatal(err)
		}

		enc := json.NewEncoder(f)
		enc.SetIndent("", "    ")
		if err := enc.Encode(results); err != nil {
			log.Fatal(err)
		}
	}
}

func compareFile(f string) (skip bool, r Result) {
	m, err := mimetype.DetectFile(f)
	if err != nil {
		log.Fatal(err)
	}

	mag := mag(f)
	mag, _, _ = mime.ParseMediaType(mag)
	if skipFile(mag, m.String()) {
		return true, r
	}
	status := statusGood
	// If the format declared by the extension is what we detected,
	// then consider it a correct guess for mimetype and wrong for file.
	// Although file is great, it still has cases when it's wrong.
	if !m.Is(mag) && m.Extension() != filepath.Ext(f) {
		if debug {
			fmt.Printf("filepth:%s\nguessed:%s\ncorrect:%s\n\n", f, m, mag)
		}
		status = statusBad
	}
	return false, Result{
		File:     f,
		Status:   status,
		Mimetype: m.String(),
		Magic:    mag,
	}
}

func skipFile(mag, m string) bool {
	mea := mimetype.EqualsAny
	// If even file cannot detect, then skip.
	// inode/x-empty is for directories, skip.
	return mea(mag, "inode/x-empty") ||
		// magic cannot detect text/vtt and we can, skip.
		(mea(m, "text/vtt") && mea(mag, "text/plain")) ||
		(mea(m, "application/x-subrip") && mea(mag, "text/plain"))
}

// mag calls the file magic detection.
func mag(f string) string {
	out, err := exec.Command("file", "-b", "--mime", f).Output()
	if err != nil {
		log.Fatal(err)
	}
	return string(out)
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
identifiedPercent: %.2f`,
		len(rs),
		stats[statusGood],
		stats[statusBad],
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

	// bs counts the most misidentified formats and what they were misidentified as.
	bs := []struct {
		magic         string
		count         int
		misIdentified map[string]int
	}{}
	for k, v := range baddies {
		bs = append(bs, struct {
			magic         string
			count         int
			misIdentified map[string]int
		}{k, v.count, v.misIdentified})
	}

	sort.Slice(bs, func(i, j int) bool {
		// sort by most misidentified
		if bs[i].count != bs[j].count {
			return bs[i].count > bs[j].count
		}
		// to keep results stable sort alphabetically too
		return bs[i].magic > bs[j].magic
	})
	for _, b := range bs {
		fmt.Printf(`
%s was misidentified %d times as:
%v
`, b.magic, b.count, b.misIdentified)
	}
	return bs
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
