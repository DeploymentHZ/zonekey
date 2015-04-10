#!/bin/bash
##  vod nginx  install 
 cd /home/soft 
 tar -zxf pcre-8.33.tar.gz
 cd cd pcre-8.33
 ./configure && make && install 
 cd ..
 tar -zxf nginx_mod_h264_streaming-2.2.7.tar.gz
 unzip nginx-rtmp-module-master.zip
 tar -zxf nginx-1.4.2.tar.gz
 cd nginx-1.4.2
 ./configure --prefix=/usr/local/nginx --add-module=../nginx_mod_h264_streaming-2.2.7 --with-http_flv_module  --with-http_stub_status_module --with-http_mp4_module --add-module=../nginx-rtmp-module-master --without-http_gzip_module --with-http_ssl_module  --with-http_dav_module --with-zlib=/usr/local/zlib/
make && make install 
cp -rf /home/soft/nginx.conf /usr/local/nginx/conf

ln -s /usr/local/lib/libpcre.so.1 /lib64/
/usr/local/nginx/sbin/nginx