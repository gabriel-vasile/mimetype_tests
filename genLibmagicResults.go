package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"slices"
	"strings"

	"al.essio.dev/pkg/shellescape"
)

func main() {
	fs := allFilesInDir("testfiles")

	// if err := exec.Command("truncate", "--
	f, err := os.Create("libmagicResults")
	if err != nil {
		panic(err)
	}
	f.Truncate(0)
	defer f.Close()

	for c := range slices.Chunk(fs, 40) {
		args := []string{"file", "--mime"}
		for _, f := range c {
			args = append(args, f)
		}
		fmt.Println(shellescape.QuoteCommand(args))
	}
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
