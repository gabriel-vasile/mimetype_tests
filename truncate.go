package main

import (
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
)

// truncates files bigger than mimetype readlimit. We're comparing mimetype with
// file(1), but mimetype has a limit on input bytes while file(1) does not.
// Truncated files make for a fair comparison between the two tools.
func main() {
	fs := []string{}
	fs = append(fs, allFilesInDir("testfiles")...)

	for _, f := range fs {
		d, err := ioutil.ReadFile(f)
		if err != nil {
			log.Fatal(err)
		}
		if len(d) <= 3072 {
			continue
		}
		d = d[:3072]

		f = strings.TrimPrefix(f, "testfiles/")
		dst := "testfiles/trunc/" + f
		if err := os.MkdirAll(filepath.Dir(dst), 0700); err != nil {
			log.Fatal(err)
		}
		ff, err := os.Create(dst)
		if err != nil {
			log.Fatal(err)
		}
		if _, err := ff.Write(d); err != nil {
			log.Fatal(err)
		}
		if err := ff.Close(); err != nil {
			log.Fatal(err)
		}
	}
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
