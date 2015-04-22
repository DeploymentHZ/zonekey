#!/bin/bash
# -*- coding:utf-8 -*- 

logfile="log.txt"

install_python273(){
    tar -jxf Python-2.7.3.tar.bz2 -C build
    cd  build/Python-2.7.3
    ./configure --prefix=/usr/local --with-zlib
    make 
    make install
    mv /usr/bin/python /usr/bin/python26
    ln -s /usr/local/bin/python2.7 /usr/bin/python
    rm -rf ../Python-2.7.3
    echo "******setup python2.7.3 done******"
    
    echo "******fix yum...******"
    sed -i 's@^#!/usr/bin/python$@#!/usr/bin/python26@' /usr/bin/yum
    echo "******fix yum finished, check if yum can still not be used, /usr/bin/yum******"
    cd ../../
}

install_tornado(){
    tar -zxf tornado-4.0.tar.gz -C build
    cd  build/tornado-4.0
    python setup.py build
    python setup.py install
    rm -rf ../tornado-4.0
    echo "******setup tornado40 done******"
    cd ../../
}

install_zlib(){
    whereis zlib >${logfile}
    abc=$(tail -1 ${logfile})
    #echo "abc,$(sed -n '$p' ${logfile})"
    if [ "zlib:" = ${abc} ]
    then 
        echo "******this centos need setup zlib******"
        tar -zxf zlib-1.2.7.tar.gz -C build
        cd build/zlib-1.2.7
        ./configure
        make
        make install
        echo "******setup zlib done******"
        rm -rf ../zlib-1.2.7
        cd ../../
    else
        echo "zlib exist" 
    fi
}

install_setuptools(){
    tar -zxf setuptools-14.3.1.tar.gz -C build 
    cd  build/setuptools-14.3.1
    python setup.py build
    python setup.py install
    rm -rf ../setuptools-14.3.1
    echo "******setup setuptools done******"
    cd ../../
}

install_backports(){
    tar -zxf backports.ssl_match_hostname-3.4.0.2.tar.gz -C build
    cd  build/backports.ssl_match_hostname-3.4.0.2
    python setup.py build
    python setup.py install
    rm -rf ../backports.ssl_match_hostname-3.4.0.2
    echo "******setup backports done******"
    cd ../../
}

install_meld3(){
    tar -zxf meld3-1.0.2.tar.gz -C build
    cd  build/meld3-1.0.2
    python setup.py build
    python setup.py install
    rm -rf ../meld3-1.0.2
    echo "****** setup meld3 done ******"
    cd ../../
}

install_supervisor(){
    tar -zxf supervisor-3.1.3.tar.gz -C build
    cd  build/supervisor-3.1.3
    python setup.py build
    python setup.py install
    rm -rf ../supervisor-3.1.3
    echo "******setup supervisor done******"
    cd ../../
    echo_supervisord_conf >/etc/supervisord.conf
    
}

vod_supervisord_conf(){
    sed -i '$a [program:vod]\ncommand=python /opt/zonekeyserver/vod/start.py\ndirectory=/opt/zonekeyserver/vod\nautostart=true\nautorestart=true\n[program:upload]\ncommand=python /opt/zonekeyserver/vod/monitor/upload.py\ndirectory=/opt/zonekeyserver/vod/monitor\nautostart=true\nautorestart=true\n' /etc/supervisord.conf
    #todo start supervisord 
}

repeater_supervisord_conf(){
    sed -i '$a [program:repeater]\ncommand=python /opt/zonekeyserver/repeater/repeater.py\ndirectory=/opt/zonekeyserver/repeater\nautostart=true\nautorestart=true\npriority=999\n[program:node_rep]\ncommand=python /opt/zonekeyserver/repeater/node_repeater.py\ndirectory=/opt/zonekeyserver/repeater\nautostart=true\nautorestart=true\npriority=900\n' /etc/supervisord.conf
}

transcoder_supervisord_conf(){
    read transcoder
}

distributer_supervisord_conf(){
    read distributer
}

install_python-mysql(){
    tar -zxf MySQL-python-1.2.3.tar.gz -C build
    cd  build/MySQL-python-1.2.3
    python setup.py build
    python setup.py install
    rm -rf ../MySQL-python-1.2.3
    echo "******setup mysql-python done******"
    cd ../../
}

install_sqlite3(){
    rpm -i sqlite-devel-3.6.20-1.el6.x86_64.rpm
}

create_zonekeyserver(){
    afile="/opt/zonekeyserver"
    if [ -e ${afile} ]
    then
        echo "exist floder /opt/zonekeyserver"
    else
        echo "not exist"
        mkdir /opt/zonekeyserver
    fi     
}

install_vod(){
    create_zonekeyserver
    tar -zxf vod.tar.gz
    mv vod /opt/zonekeyserver/
    #todo change config
    #sed '$d' /opt/zonekeyserver/vod/conf/vod.conf
    # sed -i '$a publish_url = http://${1}:80/{filename}' /opt/zonekeyserver/vod/conf/vod.conf
}

install_repeater(){
    create_zonekeyserver
    tar -zxf repeater.tar.gz
    mv repeater /opt/zonekeyserver/
    #todo change config
    
}

set_environment(){
echo "setup python-2.7.3"
install_python273

echo "setup tornado-4.0"
install_tornado

echo "setup setuptools-14.3.1"
install_setuptools

echo "setup backports.ssl_match_hostname-3.4.0.2"
install_backports

echo "setup meld3"
install_meld3

echo "setup superviosr-3.1.3"
install_supervisor
}

echo "setup 基本环境安装"
set_environment

echo "setup 点播资源服务器端接口"
install_python-mysql
install_vod
vod_supervisord_conf

echo "setup 中继中心机"
install_repeater
repeater_supervisord_conf

#repeater_supervisord_conf

#echo "setup 中继节点机"

#echo "setup 转码中心机"

#echo "setup 转码节点机"

#echo "setup 分发中心机"

#echo "setup 分发节点机"
