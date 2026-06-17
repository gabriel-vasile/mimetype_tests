package main

import (
	"bufio"
	"fmt"
	"log"
	"mime"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"sync"
	"time"

	"github.com/gabriel-vasile/mimetype"
)

// This code is a mess, but it works well enough.
// How to run:
// DEBUG=1 will enable verbose logging: all wrong detections are logged
// and tallied afterwards: DEBUG=1 go run main.go

// go run main.go # will compare mimetype to libmagic for all the files in testfiles dir

const (
	statusBad  = "bad"
	statusGood = "good"
)

var debug = os.Getenv("DEBUG") != ""
var libmagicResults = map[string]string{}

func main() {
	fmt.Println(`
This script will iterate over the samples from testfiles dir and compare mimetype
with detection results from libmagicResults.
When mimetype and libmagic disagree on what format a sample
should be it will get logged if DEBUG=1. After all samples have been compared,
the results are tallied and printed sorted by which file formats have been most
wrongfully identified. At the very end, statistics are printed as a percentage.

Expect this script to take a few minutes to run.
Call with "DEBUG=1 go run main.go" if you want to see more logging.`)
	dir := "testfiles"
	fs := allFilesInDir(dir)
	mimetype.SetLimit(0)
	exitCode := 0
	defer func() {
		os.Exit(exitCode)
	}()
	now := time.Now()
	defer func() {
		fmt.Println("total duration: %s", time.Now().Sub(now))
	}()

	libmagicResults = loadFile("libmagicResults")
	// libmagicResults = loadFile("magikaResults")
	overwrites := loadFile("overwrites")
	for k, v := range overwrites {
		libmagicResults[k] = v
	}
	fmt.Printf("loaded %d overwrites\n", len(overwrites))

	jobs := make(chan string, len(fs))
	resultsCh := make(chan Result)
	var wg sync.WaitGroup
	for range 3 {
		wg.Go(func() {
			for f := range jobs {
				skip, r := compareFile(f)
				if skip {
					continue
				}
				resultsCh <- r
			}
		})
	}
	for _, f := range fs {
		jobs <- f
	}
	close(jobs)
	go func() {
		wg.Wait()
		close(resultsCh)
	}()

	results := []Result{}
	for r := range resultsCh {
		results = append(results, r)
	}
	sort.SliceStable(results, func(i, j int) bool {
		return results[i].File < results[j].File
	})
	for _, r := range results {
		if r.Log != "" {
			fmt.Println(r.Log)
		}
	}
	_, excessiveRuntime := tallyResults(results)
	fmt.Printf("curr run: %v\n", statistic(results))

	if excessiveRuntime {
		fmt.Println("excessiveRuntime: some files took a lot to finish detection; check logs above")
		exitCode = 1
	}
	if err := overwritesCorrect(overwrites, results); err != nil {
		fmt.Println(err.Error())
		exitCode = 1
	}
}

func compareFile(f string) (skip bool, r Result) {
	d, err := os.ReadFile(f)
	if err != nil {
		log.Fatal(err)
	}

	start := time.Now()
	m := mimetype.Detect(d)
	r.Runtime = time.Now().Sub(start)

	correct, _, _ := mime.ParseMediaType(libmagicResults[f])
	if correct == "" {
		log.Print("file was skipped for some reason ", f)
	}
	status := statusGood
	// If the format declared by the extension is what we detected,
	// then consider it a correct guess for mimetype and wrong for file.
	// Although file is great, it still has cases when it's wrong.
	var logLine string
	if !m.Is(correct) && m.Extension() != filepath.Ext(f) {
		if debug {
			logLine = fmt.Sprintf("%s %s correct:%s", f, m, correct)
		}
		status = statusBad
	}
	return false, Result{
		File:     f,
		Status:   status,
		Mimetype: m.String(),
		Magic:    correct,
		Runtime:  r.Runtime,
		Log:      logLine,
	}
}

func loadFile(f string) map[string]string {
	fr, err := os.Open(f)
	if err != nil {
		log.Fatal(err)
	}
	defer fr.Close()

	ret := map[string]string{}
	s := bufio.NewScanner(fr)
	for s.Scan() {
		if l := strings.TrimSpace(s.Text()); l == "" || l[0] == '#' {
			continue
		}
		parts := strings.Split(s.Text(), ": ")
		if len(parts) != 2 {
			log.Fatal(fmt.Sprintf("not two parts %s %s", f, s.Text()))
		}

		result, _, _ := mime.ParseMediaType(strings.TrimSpace(parts[1]))
		ret[strings.TrimSpace(parts[0])] = result
	}
	if err := s.Err(); err != nil {
		log.Fatal(err)
	}
	return ret
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
func tallyResults(rs []Result) (any, bool) {
	fmt.Println("Tallying results to see which file formats were most misidentified...")
	type misIdentified struct {
		count         int
		misIdentified map[string]int
	}
	excessiveRuntime := false
	baddies := map[string]misIdentified{}
	for _, r := range rs {
		if excessiveDuration(r.Runtime) {
			excessiveRuntime = true
			fmt.Printf("excessive runtime %v\n", r)
		}
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
		fmt.Printf("%s was misidentified %d times as: %v\n", b.magic, b.count, b.misIdentified)
	}
	return bs, excessiveRuntime
}

func allFilesInDir(dir string) []string {
	ret := []string{}
	err := filepath.Walk(dir,
		func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if strings.Contains(path, "/.git/") {
				return nil
			}
			if info.Size() == 0 {
				return nil
			}
			if strings.Contains(path, "/trunc/") {
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

func overwritesCorrect(overwrites map[string]string, results []Result) error {
	gotIncorrect := false
	for k, v := range overwrites {
		for _, r := range results {
			if r.File == k {
				if !mimetype.EqualsAny(r.Mimetype, v) {
					gotIncorrect = true
					fmt.Printf("one overwrite is not detected correctly %s; got: %s, correct %s\n",
						r.File, r.Mimetype, v)
				}
			}
		}
	}
	if gotIncorrect {
		return fmt.Errorf("overwrites incorrectly detected")
	}
	return nil
}

type Result struct {
	File     string
	Status   string
	Mimetype string
	Magic    string
	Runtime  time.Duration
	Log      string
}

func excessiveDuration(d time.Duration) bool {
	return d > 5*time.Millisecond
}
