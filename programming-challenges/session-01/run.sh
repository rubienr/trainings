#!/bin/bash

echo "running a.out ..."
time ./a.out < data-input.txt > output-current.txt 

echo "Output difference (diff) - left expected (baseline), right current (yours):"
diff output-expected.txt output-current.txt
