import  re
import ConfigParser

config=ConfigParser.ConfigParser()
config.readfp(open('./conf/config.ini',"rb"))
dbpwd=config.get("database",'dbpwd')
vod_ip=config.get("vod",'vod_nginx_ip')

path='/opt/zonekeyserver/vod/conf/'

def mod_ip ():
    a=open(path+'vod.conf','r')
    ip1 = re.compile(r'192.168.12.219')
    dbpwd_re=re.compile(r'123456')
    list=[]
    while 1:
        b=a.readline()
        ip=ip1.search(b)
        dbpwd_sear=dbpwd_re.search(b)
        list.append(b)
        if not b:
            break
        elif ip:
            add= list.index(b)
            del list[add]
            w=re.sub(ip1,vod_ip,b)
            list.insert(add,w)
        elif dbpwd_sear:
            add= list.index(b)
            del list[add]
            w=re.sub(dbpwd_re,dbpwd,b)
            list.insert(add,w)


    a.close()
    aa=open(path+'vod.conf','w')
    for i in list:
        aa.write(i)
    aa.close()
mod_ip()