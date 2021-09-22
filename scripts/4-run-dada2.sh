#!/bin/bash

qiime dada2 denoise-paired \
    --i-demultiplexed-seqs artifacts/demux-paired-end.qza \
    --p-trim-left-f 0 \
    --p-trim-left-r 0 \
    --p-trunc-len-f 240 \
    --p-trunc-len-r 200 \
    --p-max-ee-f 2.0 \
    --p-max-ee-r 2.0 \
    --p-n-threads 4 \
    --o-representative-sequences artifacts/rep-seqs.qza \
    --o-table artifacts/table.qza \
    --o-denoising-stats artifacts/denoising-stats.qza

qiime metadata tabulate --m-input-file artifacts/denoising-stats.qza \
    --o-visualization visualizations/denoising-stats.qzv
