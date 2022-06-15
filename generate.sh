#!/bin/bash

echo "Updating webpage"
pandoc -s README.md --toc -c pandoc.css --metadata title="MEDP 7098" -o docs/index.html

echo "Updating lecture slides"

cd 1-intro-linux/ && jupyter nbconvert Session1.ipynb  --to slides --output-dir ../docs/

