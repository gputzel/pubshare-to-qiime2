#!/bin/bash

qiime diversity core-metrics-phylogenetic \
    --i-phylogeny artifacts/rooted-tree.qza \
    --i-table artifacts/table-length-filtered.qza \
    --p-sampling-depth 10000 \
    --m-metadata-file mapping-file.tsv \
    --output-dir core-diversity-metrics

