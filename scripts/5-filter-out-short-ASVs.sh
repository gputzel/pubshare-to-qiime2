#!/bin/bash

qiime feature-table filter-seqs \
    --i-data artifacts/rep-seqs.qza \
    --m-metadata-file artifacts/rep-seqs.qza \
    --p-where 'length(sequence) > 300' \
    --o-filtered-data artifacts/rep-seqs-length-filtered.qza

qiime feature-table filter-features \
    --i-table artifacts/table.qza \
    --m-metadata-file artifacts/rep-seqs.qza \
    --p-where 'length(sequence) > 300' \
    --o-filtered-table artifacts/table-length-filtered.qza

qiime feature-table tabulate-seqs \
    --i-data artifacts/rep-seqs-length-filtered.qza \
    --o-visualization visualizations/rep-seqs-length-filtered.qzv

qiime feature-table summarize \
    --i-table artifacts/table-length-filtered.qza \
    --o-visualization visualizations/table-length-filtered.qzv
