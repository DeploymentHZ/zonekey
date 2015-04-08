__author__ = 'hou'
import re

a=open("config.ini",'r')
b=re.compile(r'^ip.+')


while 1:
    c= a.readline()
    e=b.search(c)
    if not c:
        break
    elif e:
        k=e.group(0)
        k=k[-14:]

        if k== '192.168.12.122':
            print 1111111111
        else:
            print 2222222222