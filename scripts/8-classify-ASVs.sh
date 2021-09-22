#!/bin/bash

[ ! -d tmp_qiime2_classify ] && mkdir tmp_qiime2_classify
export TMPDIR=tmp_qiime2_classify
qiime feature-classifier classify-sklearn \
    --i-classifier artifacts/naive-bayes-classifier.qza \
    --i-reads artifacts/rep-seqs-length-filtered.qza \
    --o-classification artifacts/classified-rep-seqs.qza
rm -r tmp_qiime2_classify

qiime metadata tabulate \
    --m-input-file artifacts/classified-rep-seqs.qza \
    --o-visualization visualizations/classified-rep-seqs.qzv
