import re
import ConfigParser

config=ConfigParser.ConfigParser()
config.readfp(open('./conf/config.ini',"rb"))
ip=config.get("global",'ip')
a=open('global_conf.json','r')\
b=a.readline()
def mod_ip ():
    ip1 = re.compile(r'(?<![\.\d])(?:\d{1,3}\.){3}\d{1,3}(?![\.\d])')
    while 1:
        if not b:
            break
        elif ip1.search(b):
            print 1111


    a.close(

    )





mod_ip()