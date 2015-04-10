#!/bin/bash
name=`ls  ./data |grep *.sql|cut -d . -f 1`
mysqladmin -uroot password $name
mysql -u root -p$name  < ./data/$name.sql