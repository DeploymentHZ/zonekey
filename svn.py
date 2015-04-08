#!/usr/bin/python

import os

def upsvn(user,pwd,path):
    strexec="svn up '%s' --username %s --password %s --no-auth-cache"%(path,user,path)
    print ("cmd:%s"%strexec)
    Exec=os.system(strexec)
    print("Exec=%d"%Exec)
    return (0==Exec)


if "__main--"==__name__:
    up= upsvn('','','')
    if up:
        print 'ok'
    else:
        print 'no'