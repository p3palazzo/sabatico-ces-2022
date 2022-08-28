cv.pdf : cv.md defaults.yaml cv.yaml
	pandoc -o $@ -d defaults.yaml $<

%.pdf : %.md defaults.yaml cv.yaml
	pandoc -o $@ -d defaults.yaml $<

%.tex : %.md defaults.yaml cv.yaml
	pandoc -o $@ -d defaults.yaml $<
	
.PHONY : clean
clean :
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml
