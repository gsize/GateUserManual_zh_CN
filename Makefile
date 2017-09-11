# $Id: Makefile 01 2016-01-18 15:39:44 gsize $
# Makefile for TeX Live documentation.  Public domain.
TEX = xelatex
BIB = bibtex
doc = main
source = $(doc).tex
pdf = $(doc).pdf


all: $(pdf)

env = TEXINPUTS=./:; export TEXINPUTS;

#$(pdf): $(source) tex-zh-cn.sty
$(pdf): $(source) 
	$(env) $(TEX) $<
	$(env) $(TEX) $<
	$(env) $(BIB) $(doc).aux
	$(env) $(TEX) $<

clean:
	rm -f *.aux *.log *.blg *.bbl *.toc *.out *.lot tex4ht.ps *.4*
	rm -f *.xref* *.lg *.idv *.out *.otc *.tmp tmp.*
	rm -f $(doc).dvi $(doc).ps $(doc).pdf

realclean: clean
	rm -f $(doc).pdf
	rm -f *.html *.htm $(doc).css *.gif *.jpg

