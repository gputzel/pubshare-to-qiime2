#!/bin/bash

qiime alignment mafft \
    --i-sequences artifacts/rep-seqs-length-filtered.qza \
    --o-alignment artifacts/aligned-rep-seqs.qza

qiime alignment mask \
    --i-alignment artifacts/aligned-rep-seqs.qza \
    --o-masked-alignment artifacts/masked-aligned-rep-seqs.qza

qiime phylogeny fasttree \
    --i-alignment artifacts/masked-aligned-rep-seqs.qza \
    --o-tree artifacts/unrooted-tree.qza

qiime phylogeny midpoint-root \
    --i-tree artifacts/unrooted-tree.qza \
    --o-rooted-tree artifacts/rooted-tree.qza
