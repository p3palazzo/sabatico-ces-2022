output : cv.pdf plano-trabalho.docx

%.docx : %.md _spec/docx.yaml %.yaml
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` \
		pandoc/core:2.19.2 -o $@ -d _spec/docx.yaml $<

%.pdf : %.md _spec/defaults.yaml cv.yaml
	docker run --rm --volume "`pwd`:/data" --user `id -u`:`id -g` \
		palazzo/pandoc-ebgaramond:2.19.2 -o $@ -d _spec/defaults.yaml $<

%.tex : %.md _spec/defaults.yaml cv.yaml
	pandoc -o $@ -d _spec/defaults.yaml $<
	
.PHONY : clean
clean :
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml
