compile: *tex *bib
	pdflatex root

bib: *bib
	bibtex root

full: *tex *bib
	pdflatex -interaction=nonstopmode root
	bibtex conf
	bibtex thesis
	pdflatex root
	pdflatex root

clean:
	rm *aux *bbl *blg *out *log
