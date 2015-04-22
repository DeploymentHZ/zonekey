#!/usr/bin/python
import os
import re
import ConfigParser
import check_netfile
from socket import socket, SOCK_DGRAM, AF_INET

config=ConfigParser.ConfigParser()
config.readfp(open('./conf/config.ini',"rb"))
NetInterface=config.get("global",'NetInterface')
ip=config.get("global",'ip')
netmask=config.get("global",'netmask')
gateway=config.get("global",'gateway')
dns1=config.get("global",'dns1')
dns2=config.get("global",'dns2')
path='/etc/sysconfig/network-scripts/'

def update_onboot():
    a=open(path+NetInterface,'r')
    match=re.compile(r'ONBOOT')
    list=[]
    while 1:
        c= a.readline()
        if not c:
            break
        elif match.search(c):
            pass
        else:
            list.append(c)
    a.close()
    list.append("ONBOOT=yes\n")
    a=open(path+NetInterface,'w')
    for i in list:
        a.write(i)
    a.close()

def update_ip():
    a=open(path+NetInterface,'r')
    match_bootproto=re.compile(r'BOOTPROTO')
    match_ip=re.compile(r'IPADDR')
    match_netmask=re.compile(r'NETMASK')
    match_gateway=re.compile(r'GATEWAY')
    match_dns1=re.compile(r'DNS1')
    match_dns2=re.compile(r'DNS2')
    list=[]
    while 1:
        c= a.readline()
        if not c:
            break
        elif match_bootproto.search(c):
            pass
        elif match_ip.search(c):
            pass
        elif match_netmask.search(c):
            pass
        elif match_gateway.search(c):
            pass
        elif match_dns1.search(c):
            pass
        elif match_dns2.search(c):
            pass
        else:
             list.append(c)
    a.close()
    list.append("BOOTPROTO=static\n")
    list.append("IPADDR=%s\n"%ip)
    list.append("NETMASK=%s\n"%netmask)
    list.append("GATEWAY=%s\n"%gateway)
    list.append("DNS1=%s\n"%dns1)
    list.append("DNS2=%s\n"%dns2)
    a=open(path+NetInterface,'w')
    for i in list:
        a.write(i)
    a.close()

def restart_ip():
        if check_netfile.isfile()==True:
            update_onboot()
            update_ip()
            os.system('/etc/init.d/network restart >>/dev/null')
        else:
            print "No found network files"

def get_ip():
	s=socket(AF_INET,SOCK_DGRAM)
	s.connect(('baidu.com',0))
	return s.getsockname()


