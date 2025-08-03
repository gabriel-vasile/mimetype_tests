#  mimetype tests files

A collection of files gathered from different sources to be used for tests that
compare [mimetype](https://github.com/gabriel-vasile/mimetype/) with the
[UNIX file utility](https://en.wikipedia.org/wiki/File_(command)).


### Contents
- [testfiles](testfiles) contains all the test files (around 32 000 entries)
- [zipshuffler.go](zipshuffler.go) reads zip files and then creates random
permutations of the files inside the zip.
- [truncate.go](truncate.go) creates 3KB truncated copies of all the files
- [main.go](main.go) iterates over all files and compares our results with the
results of `file --mime`


### Results
Around 97% of the files are identified correctly. The 3% misidentified files,
most are indeed misidentified files, but some happen because `mimetype`
identifies more precisely than `file`:
- XML based file formats, like GML, GPX, are seens as generic `text/xml` by `file`
- `mimetype` identifies subtitles as `text/vtt`, while `file` sees them just as `plain/text`
- `mimetype` identifies `text/tab-separated-values`, while `file` sees just `plain/text`
- etc.
 
[Actions](https://github.com/gabriel-vasile/mimetype_tests/actions) page shows
the latest percentage of misidentified files and a breakdown of what are the
most misidentified formats.
If you want to run the tests, use [these commands](https://github.com/gabriel-vasile/mimetype_tests/blob/ee7f11cdc202944593a61ba0c675183b797a11ba/.github/workflows/test.yml#L30-L32).
