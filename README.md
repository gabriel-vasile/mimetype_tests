#  mimetype tests files

A collection of files gathered from different sources to be used for tests that
compare [mimetype](https://github.com/gabriel-vasile/mimetype/) with the
[UNIX libmagic utility](https://en.wikipedia.org/wiki/File_(command)).


### Results
TLDR: ~90% of samples identified correctly

The misidentified files,
most are indeed misidentified files, but some happen because `mimetype`
identifies more precisely than `libmagic`:
- XML based file formats, like GML, GPX, are seens as generic `text/xml` by `libmagic`
- `mimetype` identifies subtitles as `text/vtt`, while `libmagic` sees them just as `plain/text`
- `mimetype` identifies `text/tab-separated-values`, while `libmagic` sees just `plain/text`
- etc.

Update 01/2026: after adding the samples [pronom-research](https://github.com/glepore70/pronom-research)
the correctly identified percentage dropped from 97% to 90%.

Magika: tried magika instead of libmagic as benchmark, but magika and libmagic
don't agree too much on results. It seems to be mostly magika being wrong
(that is not to say libmagic is always right, all these magic number detection
solutions are easy to trick). A comprehensive analysis is hard to get,
but it seems libmagic is better than magika. Some key places where magika fails are:
- binary files that contain some ASCII strings: these will often be clasified as text/plain
- zip file using STORE compression (aka, no compression) containing a .docx
file: will be detected as .docx


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
