
import re
import ConfigParser

path='/home/ftp_download/'
config=ConfigParser.ConfigParser()
config.readfp(open('./conf/config.ini',"rb"))
ip=config.get("global",'ip')
dbname=config.get("database",'dbname')
dbpwd=config.get("database",'dbpwd')

def mod_conf ():
    a=open(path+'config.ini','r')
    ip_re = re.compile(r'(?<![\.\d])(?:\d{1,3}\.){3}\d{1,3}(?![\.\d])')
    dbname_re=re.compile(r'dis_test_8081')
    dbpwd_re=re.compile(r'123456')
    list=[]
    while 1:
        b=a.readline()
        ip_sera=ip_re.search(b)
        dbname_sera=dbname_re.search(b)
        dbpwd_sera=dbpwd_re.search(b)
        list.append(b)
        if not b:
            break
        elif ip_sera:
            add= list.index(b)
            del list[add]
            w=re.sub(ip_re,ip,b)
            list.insert(add,w)
        elif dbname_sera:
            add= list.index(b)
            del list[add]
            w=re.sub(dbname_re,dbname,b)
            list.insert(add,w)
        elif dbpwd_sera:
            add= list.index(b)
            del list[add]
            w=re.sub(dbpwd_re,dbpwd,b)
            list.insert(add,w)

    a.close()
    print list
    aa=open(path+'config.ini','w')
    for i in list:
        aa.write(i)
    aa.close()


