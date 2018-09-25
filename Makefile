
SAMPLE_DIR = sections/code
OUT_DIR = out
SAMPLES = $(addprefix $(OUT_DIR)/, kv0.rad-tex kv1.rad-tex repl.rad-tex currency.rad-tex)

.PHONY: ALL
all: $(SAMPLES) LATEX

clean:
	rm $(SAMPLES)
	rm -f out/radicle.pdf

$(SAMPLES): $(OUT_DIR)/%.rad-tex : $(SAMPLE_DIR)/%.rad
	echo '\begin{lstlisting}' > $@
	cat $^ >> $@
	echo '\end{lstlisting}' >> $@

.PHONY: LATEX
LATEX:
	latexmk -pdf -jobname=./out/radicle -interaction=errorstopmode -halt-on-error radicle.tex
