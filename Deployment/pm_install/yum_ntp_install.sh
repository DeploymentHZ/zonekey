#!/bin/bash
rpm -ivh ./sources/epel-release-6-8.noarch.rpm
cp -rf ./conf/epel.repo /etc/yum.repos.d/
yum install glances ntp -y
cp -rf ./conf/ntp.conf /etc
/etc/init.d/ntpd start

