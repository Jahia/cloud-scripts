#!/bin/bash

REPO="/root/thread_dumps"

# add jstack to /usr/bin if not present
if [[ ! -f "/usr/bin/jstack" ]]; then
    jstack=$(find /usr/java/openjdk-*/bin -name jstack)
    ln -s $jstack /usr/bin/
fi

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

version=$(grep DX_VERSION /.jelenv |cut -d'=' -f2)
if [[ $version == 7.3* ]]; then
    jstack -l $PID > "$REPO/$today/$hour/$minute"
else
    sudo -u tomcat jstack -l $PID > "$REPO/$today/$hour/$minute"
fi

# remove files older than 30 days
find $REPO -type f -mtime +30 -exec rm -f {} \;
