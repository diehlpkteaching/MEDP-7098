#!/bin/bash

echo "Updating webpage"
pandoc -s README.md --toc -c pandoc.css --metadata title="MEDP 7098" -o docs/index.html

echo "Updating lecture slides"

cd 1-intro-linux/ && jupyter nbconvert Session1.ipynb  --to slides --output-dir ../docs/ && cd ..
cd 2-intro-python/ && jupyter nbconvert Session2.ipynb  --to slides --output-dir ../docs/ && cd ..
cd 3-examples-python/ && jupyter nbconvert Session3.ipynb  --to slides --output-dir ../docs/ && cd ..
cd 25-intro-hpc-tools && jupyter nbconvert Session25.ipynb  --to slides --output-dir ../docs/ 
