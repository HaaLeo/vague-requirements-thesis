#!/bin/zsh

cd ./thesis

# Endnote cannot directly export to thesis.bib
mv thesis.txt thesis.bib

pdflatex -synctex=1 -interaction=nonstopmode -file-line-error thesis.tex
bibtex thesis
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error thesis.tex
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error thesis.tex
