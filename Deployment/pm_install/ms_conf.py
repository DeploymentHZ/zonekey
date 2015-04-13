import re
import ConfigParser

config=ConfigParser.ConfigParser()
config.readfp(open('./conf/config.ini',"rb"))
ip=config.get("global",'ip')
a=open('global_conf.json','r')

def mod_ip ():
    ip1 = re.compile(r'(?<![\.\d])(?:\d{1,3}\.){3}\d{1,3}(?![\.\d])')
    list=[]
    while 1:
        b=a.readline()
        c=ip1.search(b)
        list.append(b)
        if not b:
            break
        elif c:
            add= list.index(b)
            del list[add]
            w=re.sub(ip1,ip,b)
            list.insert(add,w)

    a.close()
    aa=open('global_conf.json','w')
    for i in list:
        aa.write(i)
    aa.close()
mod_ip()