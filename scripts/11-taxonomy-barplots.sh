#!/bin/bash

qiime taxa barplot \
    --i-table artifacts/table-length-filtered.qza \
    --i-taxonomy artifacts/classified-rep-seqs.qza \
    --m-metadata-file mapping-file.tsv \
    --o-visualization visualizations/taxa-bar-plots.qzv

