# Makefile for CV with pandoc + latex
# Author: Mattia Mantovani
# Last modified: Sun Apr 26, 2020  06:08PM
# {{{ Variables

PANDOC      := pandoc
CV          := cv
CL          := coverletters
COMPS       := $(basename $(notdir $(wildcard $(CL)/*.tex)))
CVS         := $(addsuffix -cv,$(COMPS))
LETTS       := $(addsuffix -letter,$(COMPS))

# }}}
# {{{ Rules

default: $(CV).pdf

all: all-cvs all-letts

all-cvs: $(CVS)

all-letts: $(LETTS)

$(CVS) $(LETTS) $(CV): %: %.pdf

$(COMPS): %: %_cv %_letter

$(CV).pdf: $(CV).tex
	@$(PANDOC) -o $@ $< --template=$<

%-cv.pdf: $(CV).tex $(CL)/%.tex
	$(eval CLF := $(filter-out $<,$^))
	@$(PANDOC) -o $(CLF).tmp $< --template=$(CLF)
	@$(PANDOC) -o $@ $< --template=$< -V coverletter=$(CLF).tmp && rm $(CLF).tmp

%-letter.pdf: $(CL)/%.tex
	@$(PANDOC) -o $@ $< --template=$< -V onlyletter

.PHONY: clean
clean:
	find . -type f -name "*.pdf" -and -not -name "$(CV).pdf" -exec rm -vf {} \;

# }}}
