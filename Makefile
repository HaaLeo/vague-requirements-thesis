FILE := main
OUT  := build
JOBNAME := 'Detecting Vague Requirements with Machine Learning'

.PHONY: bibliography
bibliography:
	[[ ! -a bibliography.txt ]] || mv bibliography.txt bibliography.bib

.PHONY: pdf
pdf: bibliography
	latexmk -interaction=nonstopmode -outdir=$(OUT) -jobname=$(JOBNAME) -pdf -halt-on-error $(FILE)

.PHONY: watch
watch: bibliography
	latexmk -interaction=nonstopmode -outdir=$(OUT) -jobname=$(JOBNAME) -pdf -pvc -halt-on-error $(FILE)

.PHONY: clean
clean:
	rm -rf $(filter-out $(OUT)/$(JOBNAME).pdf, $(wildcard $(OUT)/*))

.PHONY: purge
purge:
	rm -rf $(OUT)
