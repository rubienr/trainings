#!/bin/bash

echo "crating table of contents ..."
echo -en "*document heavily under construction*\n\n# Table of Contents" >  README.md
awk --file get_md_toc.awk content.md >> README.md
echo "---"  >> README.md
echo "adding content ..."
cat content.md >> README.md
echo "done"
