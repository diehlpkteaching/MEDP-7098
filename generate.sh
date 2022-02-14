#!/usr/bin/bash

echo "Updating webpage"
pandoc -s README.md --toc -c pandoc.css --metadata title="MEDP 7098" -o docs/index.html

