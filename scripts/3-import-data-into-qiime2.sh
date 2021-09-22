#!/bin/bash

[ ! -d "artifacts" ] && mkdir artifacts
qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
    --input-path sample-manifest.txt \
    --input-format PairedEndFastqManifestPhred33V2 \
    --output-path artifacts/demux-paired-end.qza

[ ! -d "visualizations" ] && mkdir visualizations
#Visualization
qiime demux summarize --i-data artifacts/demux-paired-end.qza \
    --o-visualization visualizations/demux-paired-end.qzv \
    --verbose
