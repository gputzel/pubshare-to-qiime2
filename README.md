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

    scripts/0-download-data.sh

### Make a sample manifest

    scripts/
