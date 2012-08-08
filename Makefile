# Author: James Robinson

MAINFILE = thesis

.PHONY: all
all: $(MAINFILE).pdf

$(MAINFILE).pdf: $(MAINFILE).tex
	pdflatex $(MAINFILE)
	bibtex $(MAINFILE)
	pdflatex $(MAINFILE)
	pdflatex $(MAINFILE)

.PHONY: clean
clean:
	-rm -f *.600pk
	-rm -f *.aux
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.blg
	-rm -f *.fdb_latexmk
	-rm -f *.fls
	-rm -f *.lof
	-rm -f *.log
	-rm -f *.lot
	-rm -f *.out
	-rm -f *.tfm
	-rm -f *.toc
	-rm -f chapters/*/*-eps-converted-to.pdf
	-rm -f chapters/*/*.aux
	-rm -f chapters/*/.*.tex.ini
	-rm -f chapters/*/.*.tex.properties.xml
	-rm -f comment.cut
	-rm -f structure/*.aux

.PHONY: cleanall
cleanall: clean
	-rm -f thesis.pdf

.PHONY: check
check:
	bash proofer.sh
