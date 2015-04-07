#!/usr/bin/python
import os
filepath='/etc/sysconfig/network-scripts/'

allfile=os.listdir(filepath)
netfile=allfile.index('ifcfg-*')