#!/bin/bash

echo "crating table of contents ..."
echo "# Table of Contents" >  README.md
awk --file get_md_toc.awk body.md >> README.md
echo "---"  >> README.md
echo "adding content ..."
cat body.md >> README.md
echo "done"
