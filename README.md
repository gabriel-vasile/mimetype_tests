#  mimetype tests files

A collection of files gathered from different sources to be used for tests that
compare [mimetype](https://github.com/gabriel-vasile/mimetype/) with the
[UNIX file utility](https://en.wikipedia.org/wiki/File_(command)).


### Results
TLDR: ~97% of samples identified correctly


The 3% misidentified files,
most are indeed misidentified files, but some happen because `mimetype`
identifies more precisely than `file`:
- XML based file formats, like GML, GPX, are seens as generic `text/xml` by `file`
- `mimetype` identifies subtitles as `text/vtt`, while `file` sees them just as `plain/text`
- `mimetype` identifies `text/tab-separated-values`, while `file` sees just `plain/text`
- etc.
 
[Results](https://github.com/gabriel-vasile/mimetype_tests/actions) show
the latest percentage of misidentified files and a breakdown of what are the
most misidentified formats.
If you want to run the tests, use [these commands](https://github.com/gabriel-vasile/mimetype_tests/blob/1c1f5cd612cb56c45c8ad3f608b94167063b6de0/.github/workflows/test.yml#L31-L34).


### Contents
- [testfiles](testfiles) contains all the test files (around 50 000 entries)
- [zipshuffler.go](zipshuffler.go) reads zip files and then creates random
permutations of the files inside the zip.
- [truncate.go](truncate.go) creates 3KB truncated copies of all the files
- [main.go](main.go) iterates over all files and compares our results with the
results of `file --mime`
