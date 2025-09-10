#!/bin/bash
# List all pdf files recursively in the current directory
find . -name "*.pdf" -exec echo "{}" \;

# use pdfunite
pdfunite $(find . -name "*.pdf" | sort) final.pdf
