#!/bin/bash

forward=$(ls -1 FASTQ/ | grep "_R1_001.fastq.gz")
first=$(echo $forward | grep -o "^\w*\b")

echo $first
