#  mimetype sample files

A collection of files gathered from different sources to be used for tests that
compare [mimetype](https://github.com/gabriel-vasile/mimetype/) with the
[UNIX file utility](https://en.wikipedia.org/wiki/File_(command)).


### Contents
- [testfiles](testfiles) contains all the test files (around 75 000 entries)
- [zipshuffler.go](zipshuffler.go) reads zip files and then creates random
permutations of the files inside the zip.
- [truncate.go](truncate.go) creates 3KB truncated copies of all the files
- [main.go](main.go) iterates over all files and compares our results with the
results of `file --mime`


### Results
Around 95% of the files are identified correctly. Of the 5% misidentified files,
majority are obscure file formats that we don't support and some happen because
`mimetype` identifies more precisely than `file`:
- mimetype identifies subtitles as `text/vtt`, while `file` sees them just as `plain/text`
-
Results can be seen in the [actions](actions) tab.
If you want to test for yourself, you can use these commands.
