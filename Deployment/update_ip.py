#!/usr/bin/python
import os
import re
import ConfigParser

config=ConfigParser.ConfigParser()
config.readfp(open('config.ini',"rb"))
NetInterface=config.get("global",'NetInterface')
ip=config.get("global",'ip')
netmask=config.get("global",'netmask')
gateway=config.get("global",'gateway')
dns1=config.get("global",'dns1')
dns2=config.get("global",'dns2')
path='/etc/sysconfig/network-scripts/'

a=open(path+NetInterface,'r')
match=re.compile(r'ip')
match1=re.compile(r'dns1')
list=[]
while 1:
    c= a.readline()
    if not c:
        break
    elif match.search(c):
        pass
    elif match1.search(c):
        pass
    else:
        list.append(c)
a.close()
list.append("ip = 192.168.12.123")
a=open('config.ini','w')
for i in list:
    a.write(i)
a.close()

