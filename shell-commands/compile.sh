#!/bin/bash

echo "crating table of contents ..."
echo -en "*document heavily under construction*\n\n# Table of Contents\n" >  README.md
awk --file extract_toc.awk content.md >> README.md
echo "---"  >> README.md
echo "adding content ..."
cat content.md >> README.md
echo "done"
