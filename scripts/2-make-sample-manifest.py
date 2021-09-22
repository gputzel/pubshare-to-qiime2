#!/usr/bin/env python

import glob
import re
import os

wd = os.getcwd()
path = wd + "/FASTQ/"

forward = [s.split("/")[-1] for s in glob.glob("FASTQ/*_R1_001.fastq.gz")]
reverse = [s.replace("_R1_001","_R2_001") for s in forward]

pattern = "_16S_\d{8}"
result = re.split(pattern,forward[0])

samples = [re.split(pattern,f)[0] for f in forward]

with open("sample-manifest.txt","w") as fout:
    fout.write("sample-id\tforward-absolute-filepath\treverse-absolute-filepath\n")
    for sample,f,r in zip(samples,forward,reverse):
        f_abs = path + f
        r_abs = path + r
        fout.write(sample + "\t" + f_abs + "\t" + r_abs + "\n")
