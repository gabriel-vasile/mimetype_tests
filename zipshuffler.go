package main

import (
	"archive/zip"
	"bytes"
	"fmt"
	"io"
	"log"
	"math/rand"
	"os"
)

// Zip files are problematic because of two reasons:
// - the list of entries is at the end of the zip (mimetype only read the header)
// - technically zip entries can have any order (practically, many implementations
// have a pre-defined order).
// file/file seems to detect jar files only if the first file inside the zip
// container is META-INF/MANIFEST.MF. But order of files inside a zip should not
// make a difference. This program takes some .jar files as input, shuffles the
// files inside the zip and creates new zips. It then tests if the newly generated
// jars are usable. I'm not sure if for mimetype I should detect a zip as jar if
// it contains META-INF/MANIFEST.MF as first or as any file in the zip.
//
// This program takes some zip container files (docx, pptx, jar, etc.) and
// shuffles the zip entries inside those.
func main() {
	fs := []string{
		"zipsources/droid-tools-6.9.3.jar",
		"zipsources/docx.docx",
		"zipsources/xlsx.xlsx",
	}

	os.Mkdir("testfiles/zips", os.ModePerm)
	for _, f := range fs {
		if err := shuffleZip(f); err != nil {
			log.Fatal(err)
		}
	}
}

// Use a predefined source for reproducibility.
var r = rand.New(rand.NewSource(0))
var j = 0

func shuffleZip(original string) error {
	z, err := zip.OpenReader(original)
	if err != nil {
		return err
	}
	defer z.Close()

	for i := 0; i < 2000; i++ {
		r.Shuffle(len(z.File), func(i, j int) {
			z.File[i], z.File[j] = z.File[j], z.File[i]
		})
		f := fmt.Sprintf("testfiles/zips/%d.zip", j)
		j++
		if err := createZip(f, z.File); err != nil {
			return err
		}
	}
	return nil
}

func createZip(dst string, fs []*zip.File) error {
	f, err := os.Create(dst)
	if err != nil {
		return err
	}

	w := zip.NewWriter(f)

	for _, f := range fs {
		h := f.FileHeader
		wrf, err := w.CreateHeader(&h)
		if err != nil {
			return err
		}
		content, err := f.Open()
		if err != nil {
			return err
		}
		if _, err := io.Copy(wrf, content); err != nil {
			return err
		}

	}

	f.Close()
	w.Close()

	f, err = os.Open(dst)
	if err != nil {
		return err
	}
	if err := createZipUncompressed(f); err != nil {
		return err
	}
	return nil
}

// zip entry traversal is not reliable in mimetype, especially when the zip is
// uncompressed and the entries are just other zips. Create uncompressed zips
// to test those cases.
func createZipUncompressed(content io.Reader) error {
	f, err := os.Create(fmt.Sprintf("testfiles/zips/uncomp%d.zip", j))
	if err != nil {
		return err
	}
	defer f.Close()
	w := zip.NewWriter(f)

	contents := []io.Reader{content, nRandomBytes(1000), nRandomBytes(1000)}
	r.Shuffle(len(contents), func(i, j int) {
		contents[i], contents[j] = contents[j], contents[i]
	})

	for i := 0; i < len(contents); i++ {
		file, err := w.CreateHeader(&zip.FileHeader{
			Name:   fmt.Sprintf("file%d", i),
			Method: zip.Store, // Store means 0 compression.
		})
		if err != nil {
			return err
		}
		if _, err := io.Copy(file, contents[i]); err != nil {
			return err
		}
	}

	return w.Close()
}

func nRandomBytes(n int) *bytes.Reader {
	randData := make([]byte, n)
	io.ReadFull(r, randData)
	return bytes.NewReader(randData)
}
