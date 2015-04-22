import re
import ConfigParser

dev_path='/home/tomcat/tomcat8080/webapps/deviceService/WEB-INF/classes/'
db_path='/home/tomcat/tomcat8080/webapps/disrec/WEB-INF/classes/'
front_path='/home/tomcat/tomcat8080/webapps/disrec/front/common/'
log_path='/home/tomcat/tomcat8080/webapps/disrec/WEB-INF/classes/'

config=ConfigParser.ConfigParser()
config.readfp(open('./conf/config.ini',"rb"))
ip=config.get("global",'ip')
dbname=config.get("database",'dbname')
dbpwd=config.get("database",'dbpwd')

def mod_dev ():
    a=open(dev_path+'deployment.properties','r')
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
    aa=open(dev_path+'deployment.properties','w')
    for i in list:
        aa.write(i)
    aa.close()
def mod_front ():
    a=open(front_path+'config.js','r')
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
    aa=open(front_path+'config.js','w')
    for i in list:
        aa.write(i)
    aa.close()
def mod_db():
    a=open(db_path+'application.properties','r')
    ip_re = re.compile(r'(?<![\.\d])(?:\d{1,3}\.){3}\d{1,3}(?![\.\d])/dis_sdsf')
    dbname_re=re.compile(r'sdsf')
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
            w=re.sub(ip_re,ip+'/'+dbname,b)
            list.insert(add,w)
        elif dbpwd_sera:
            add= list.index(b)
            del list[add]
            w=re.sub(dbpwd_re,dbpwd,b)
            list.insert(add,w)
    aa=open(db_path+'application.properties','w')
    for i in list:
        aa.write(i)
    aa.close()

def mod_log():
    a=open(log_path+'logback.xml','r')
    ip_re = re.compile(r'(?<![\.\d])(?:\d{1,3}\.){3}\d{1,3}(?![\.\d]):3306/dis_sdsf')
    dbpwd_re=re.compile(r'123456')
    list=[]
    while 1:
        b=a.readline()
        ip_sera=ip_re.search(b)
        dbpwd_sera=dbpwd_re.search(b)
        list.append(b)
        if not b:
            break
        elif ip_sera:
            add= list.index(b)
            del list[add]
            w=re.sub(ip_re,ip+':3306/'+dbname,b)
            list.insert(add,w)
        elif dbpwd_sera:
            add= list.index(b)
            del list[add]
            w=re.sub(dbpwd_re,dbpwd,b)
            list.insert(add,w)
    aa=open(log_path+'logback.xml','w')
    for i in list:
        aa.write(i)
    aa.close()

