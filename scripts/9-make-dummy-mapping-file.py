#!/usr/bin/env python

import glob
import re

forward = [s.split("/")[-1] for s in glob.glob("FASTQ/*_R1_001.fastq.gz")]
reverse = [s.replace("_R1_001","_R2_001") for s in forward]

pattern = "_16S_\d{8}"
result = re.split(pattern,forward[0])

samples = [re.split(pattern,f)[0] for f in forward]

with open("mapping-file.tsv","w") as fout:
    fout.write("id\tgroup\n")
    for sample in samples:
        fout.write(sample + "\tAllSamples\n")
