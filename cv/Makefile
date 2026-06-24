all: en zh

en: *tex *bib
	pdflatex -interaction=nonstopmode root_en
	bibtex conf
	bibtex jour
	bibtex workshop
	bibtex thesis
	pdflatex root_en
	pdflatex root_en

zh: *tex *bib
	xelatex -interaction=nonstopmode root_zh
	bibtex conf
# 	bibtex thesis
	xelatex -interaction=nonstopmode root_zh
	xelatex -interaction=nonstopmode root_zh

clean:
	rm *aux *bbl *blg *out *log
