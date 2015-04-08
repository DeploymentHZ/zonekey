#!/usr/bin/python
import os
import ConfigParser

config=ConfigParser.ConfigParser()
config.readfp(open('config.ini',"rb"))
int=config.get("global","NetInterface")

file_path='/etc/sysconfig/network-scripts/'

def  isfile():
    file=os.path.exists(file_path+int)
    return file

print isfile()