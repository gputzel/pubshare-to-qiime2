# pubshare-to-qiime2

Scripts for getting FASTQ files from Pubshare and running them through Qiime2

## Instructions

### Clone this repository

    git clone https://github.com/gputzel/pubshare-to-qiime2
    cd pubshare-to-qiime2
    chmod +x scripts/*.sh

The last command sets permissions on the scripts so that they are executable.

### Activate conda environment

If the required conda environment (`qiime2-2019.7`) is already installed, just activate it:

    conda activate qiime2-2019.7

To create this environment:

    wget https://data.qiime2.org/distro/core/qiime2-2019.7-py36-osx-conda.yml
    conda env create -n qiime2-2019.7 --file qiime2-2019.7-py36-osx-conda.yml
    rm qiime2-2019.7-py36-osx-conda.yml

### Download FASTQ files from Pubshare

    scripts/1-download-data.sh

### Make a sample manifest

    scripts/2-make-sample-manifest.py

Note that this script ends in `.py` unlike most of the other ones.

### Import data into Qiime2

    scripts/3-import-data-into-qiime2.sh

### Run dada2

    scripts/4-run-dada2.sh

This part could take a while, especially if you have a lot of samples.

### Filter out ASVs that are too short

    scripts/5-filter-out-short-ASVs.sh

### Make a phylogenetic tree

    scripts/6-make-phylogenetic-tree.sh


