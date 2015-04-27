#!/bin/bash
cd /home/vod
cp -rf ./exports /etc/
/etc/init.d/nfs start
