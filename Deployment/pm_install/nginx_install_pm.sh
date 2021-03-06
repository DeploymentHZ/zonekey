#!/bin/bash 
cd /home/pm_install/sources
 tar -zxf pcre-8.33.tar.gz
 cd  pcre-8.33
 ./configure 
 make && make install 
 cd ..
 tar -zxf nginx-1.4.2.tar.gz
 cd nginx-1.4.2
 ./configure --prefix=/usr/local/nginx 
 make && make install 
cp -rf /home/pm_install/conf/nginx_p.conf /usr/local/nginx/conf/nginx.conf
ln -s /usr/local/lib/libpcre.so.1 /lib64/
/usr/local/nginx/sbin/nginx
cd /home/pm_install
rm -rf ./sources/pcre-8.33.tar.gz
rm -rf ./sources/nginx-1.4.2
