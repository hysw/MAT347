CLEAN_EXT={aux,toc,out,idx,log,backup,gls,glo,glsdefs,xdy,ilg,ind,ist,acn,glg,backup}

COURSECODE=MAT347

all: $(COURSECODE).pdf clean_useless

pdf: $(COURSECODE).pdf

$(COURSECODE).pdf: *.tex
	pdflatex $(COURSECODE).tex
	# texindy STA261.idx
	# note, run twice to ensure indexing is correct
	pdflatex $(COURSECODE).tex

clean_useless:
	rm -f *.${CLEAN_EXT} */*.${CLEAN_EXT} *~

clean: clean_useless
	rm -f *.pdf

commit: $(COURSECODE).pdf clean_useless
	git commit -a -m "update at `date --rfc-2822`" && git pull && git push

.PHONY: pdf clean commit clean_useless
