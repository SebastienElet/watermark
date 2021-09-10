all: *.pdf

include requirements.mk
include watermark.mk

out:
	mkdir $@
*.pdf: watermark out
	pdftk $@ stamp watermark output out/$@

clean:
	rm -rf out
	rm watermark.ps
	rm watermark
