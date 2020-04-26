# Curriculum Vitae with LaTeX and `pandoc`

## Requirements

* [pandoc](pandoc.org) (v2.9);
* [moderncv](https://ctan.org/pkg/moderncv?lang=en) LaTeX package.

## Usage
```
$ make [rule]
```
`Makefile` rules:

* `make` triggers the default rule, which will produce only the CV;
* `make [company]-cv` will produce the CV, including the cover letter for the
  given`[company]`, provided a file named `[company].tex` exists in the director  y `coverletters`;
* `make [company]-letter.pdf` will produce only the cover letter for the given
  `[company]`;
* `make [company]` will produce both `[company]-cv.pdf` and
  `[company]-letter.pdf`;
* `make all-cvs` will create all CVs with cover letters from all the companies
   found in `coverletters/`;
* `make all-letters` will create all cover letters;
* `make all` generates all CVs and all standalone cover letters;
* `make clean` will remove all generated `pdf`s.
