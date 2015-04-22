#!/bin/bash
cp -rf ./sources/ftp_download.zip /home
cd /home
unzip ftp_download.zip
chmod 777 ./ftp_download/ -R
./ftp_download/cron.sh
cd /home/pm_install


