#!/bin/bash
# list latex build files

echo $'Files to be deleted:'
ls -lX *.aux *.log *.out *.synctex.gz *.bbl *.blg
echo $'\nDeleting Now\n'
find ./ -maxdepth 1 -type f \( -name '*.aux' -o -name '*.log' -o -name '*.out' -o -name '*.synctex.gz' -o -name '*.bbl' -o -name '*.blg' \) -delete
echo $'Remaining Files:'
ls -lX 
