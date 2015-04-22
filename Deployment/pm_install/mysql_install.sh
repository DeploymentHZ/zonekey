#!/bin/bash
cd /home/pm_install/sources
tar -zxf cmake-2.8.11.2.tar.gz
cd cmake-2.8.11.2
./bootstrap
make && make install
cd /home/pm_install/sources
yum -y install ncurses-devel
tar -zxf mysql-5.5.28.tar.gz
cd mysql-5.5.28
cmake .
make && make install
groupadd mysql
useradd mysql -g mysql -s /sbin/nologin
cd /usr/local/mysql/scripts/
./mysql_install_db --basedir=/usr/local/mysql  --datadir=/usr/local/mysql/data/  --user=mysql
cd /usr/local/mysql/support-files/
cp /home/pm_install/conf/my.cnf  /etc/my.cnf
cp mysql.server /etc/init.d/mysqld
ln -s /usr/local/mysql/bin/mysql* /bin
service mysqld start
cd /home/pm_install
rm -rf /home/pm_install/sources/mysql-5.5.28
rm -rf /home/pm_install/sources/cmake-2.8.11.2
