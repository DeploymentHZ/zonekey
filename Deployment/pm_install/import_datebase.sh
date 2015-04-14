#!/bin/bash
dbname=`cat  ./conf/config.ini |grep dbname|cut -d = -f 2`
dbfile=`cat  ./conf/config.ini |grep dbfile|cut -d = -f 2`
dbpwd=`cat  ./conf/config.ini |grep dbpwd|cut -d = -f 2`

mysqladmin -uroot password $dbpwd
mysql -uroot -p$dbpwd -e "create database $dbname DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"
mysql -u root -p$dbname  < ./data/$dbfile.sql