#!/bin/bash
mkdir /home/data/upload/update -p
cp -rf ./sources/ms.zip  /home/data/upload/update
cd   /home/data/upload/update
unzip ms.zip 
cd ./ms
cp -rf  *  ../
cd ..
rm -rf ms
cd /home/pm_install
