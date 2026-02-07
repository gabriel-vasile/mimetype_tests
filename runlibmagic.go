package main

import (
	"fmt"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"slices"
	"strings"
)

func main() {
	fs := allFilesInDir("testfiles")

	for c := range slices.Chunk(fs, 50) {
		fmt.Println(c)
	}

	e1 := exec.Command("truncate", "libmagicResults").Run()
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
