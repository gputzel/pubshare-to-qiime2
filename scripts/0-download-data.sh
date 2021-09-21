#!/bin/bash

if [ -z "$1" ]
  then
    echo "Please supply path to URLs file from Pubshare."
    echo "Usage: scripts/0-download-data.sh Pubshare_Default_URLs.txt"
    exit 1
fi

[ ! -d "temp-download" ] && mkdir temp-download
read -p "Enter pubshare username:" USERNAME
read -s -p "Enter pubshare password for $USERNAME: " PASS
echo ""

for u in `cat $1`
do
    ##Remove double quotes from beginning and end
    url=`sed -e 's/^"//' -e 's/"$//' <<<"$u"`
    echo $url
    case $url in
        *.fastq.gz)
            cd temp-download
            wget -O- \
                --no-check-certificate \
                --content-disposition \
                --continue \
                --user=$USERNAME \
                --password="$PASS" $url \
                | tar -xvf -
            cd ..
            ;;
        *)
            cd temp-download
            wget \
                --no-check-certificate \
                --content-disposition \
                --continue \
                --user=$USERNAME \
                --password="$PASS" $url
            cd ..
            ;;
    esac
done

[ ! -d "FASTQ" ] && mkdir FASTQ
mv `find temp-download -name "*.fastq.gz"` FASTQ/
rm -r temp-download
