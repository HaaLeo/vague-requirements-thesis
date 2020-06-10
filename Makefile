FILE := main
OUT  := build
JOBNAME := 'Detecting Vague Requirements with Machine Learning'

.PHONY: bibfile
bibfile:
	[[ ! -a Detecting-Vague-Requiremnts-using-Machine-Learning.txt ]] || mv Detecting-Vague-Requiremnts-using-Machine-Learning.txt bibliography.bib

.PHONY: pdf
pdf: bibfile
	latexmk -interaction=nonstopmode -outdir=$(OUT) -jobname=$(JOBNAME) -pdf -halt-on-error $(FILE)

.PHONY: watch
watch: bibfile
	latexmk -interaction=nonstopmode -outdir=$(OUT) -jobname=$(JOBNAME) -pdf -pvc -halt-on-error $(FILE)

.PHONY: clean
clean:
	rm -rf $(filter-out $(OUT)/$(JOBNAME).pdf, $(wildcard $(OUT)/*))

.PHONY: purge
purge:
	rm -rf $(OUT)
