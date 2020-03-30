#!/bin/bash

REPO="/root/thread_dumps"

yesterday=$(date -d "yesterday" +'%m-%d-%Y')
if [[ -d "$REPO/$yesterday" ]]
then
    tar -zcf "$REPO/$yesterday.tar.gz" "$REPO/$yesterday"
    rm -rf "$REPO/$yesterday"
fi

today=$(date +'%m-%d-%Y')
PID=$(ps awwx |grep catalina.startup.Bootstrap |grep -v grep |cut -c -5)
hour=$(date +'%Hh')
minute=$(date +'%M')
mkdir -p "$REPO/$today/$hour"
sudo -u tomcat jstack -l $PID > "$REPO/$today/$hour/$minute"

# remove files older than 30 days
find $REPO -type f -mtime +30 -exec rm -f {} \;
