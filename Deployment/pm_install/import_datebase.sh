#!/bin/bash
dbname=`cat ./conf/config.ini |grep dbname|cut -d = -f2`
dbfile=`cat ./conf/config.ini |grep dbfile|cut -d = -f2`
dbpwd=`cat ./conf/config.ini |grep dbpwd|cut -d = -f2`

#/bin/mysql -e "update mysql.user set password=PASSWORD($dbpwd) where user='root'";
mysqladmin  password $dbpwd
/bin/mysql -uroot -p$dbpwd -e "create database $dbname DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"
/bin/mysql -uroot -p$dbpwd -e "create database vod DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"
/bin/mysql -u root -p$dbpwd $dbname  < /home/pm_install/data/$dbfile
