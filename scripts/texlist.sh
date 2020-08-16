#!/bin/bash
# list latex build files

echo $'All Files:'
ls -lX 
echo $'PDF Files:'
ls *.pdf
echo $'Files to be deleted:'
ls -lX *.aux *.log *.out *.synctex.gz *.bbl *.blg
