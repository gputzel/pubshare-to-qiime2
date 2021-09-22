#!/bin/bash

[ ! -d "artifacts" ] && mkdir artifacts
qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' --input-path sample-manifest.txt --input-format PairedEndFastqManifestPhred33V2 --output-path artifacts/demux-paired-end.qza
