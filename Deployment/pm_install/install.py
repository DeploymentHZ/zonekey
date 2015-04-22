import os
import ConfigParser
import update_ip
import tomcat_conf
import ms_conf
import ftpdownload_conf

config=ConfigParser.ConfigParser()
config.readfp(open('./conf/config.ini',"rb"))
ip=config.get("global",'ip')

def conf_ip ():
     print "\33[32mConfigure ip address\n"
     update_ip.restart_ip()
     print "IP:%s"%ip
     print "IP ADDRESS SUCCESS\n"
    

def install_yum_ntp ():
	print "start install glances & ntp"
	os.system('/home/pm_install/yum_ntp_install.sh')
	print "glances & ntp SUCCESS"

def install_jdk ():
	print "start install jdk"
	os.popen('/home/pm_install/jdk_install.sh')
	print "JDK install SUCCESS"

def mysql_install():
	proc=os.system('ps -ef|grep mysql|wc -l')
	print "START INSTALL MYSQL"
	os.system('/home/pm_install/mysql_install.sh')
	if proc==3: 
		print "MYSQL INSTALL SUCCESS"
	else:
		print "MYSQL INSTALL FAILURE"
		


def import_databases():
	print "START IMPORT DATA"
	os.system('/home/pm_install/import_datebase.sh')
	print "DATABASES IMPORT SUCCESS"


def install_tomcat():
	print "START INSTALL TOMCAT"
	os.system('/home/pm_install/tomcat_install.sh')
	print "TOMCAT INSTALL SUCCESS"
def conf_tomcat():
	print "START CONFIGURE TOMCAT"
	tomcat_conf.mod_dev()
	tomcat_conf.mod_db()
	tomcat_conf.mod_front()
	tomcat_conf.mod_log()
	print "TOMCAT CONFIGURE SUCCESS"

def install_nginx():
	print "START INSTALL NGINX"
	os.system('/home/pm_install/nginx_install_pm.sh')
	print "NGINX INSTALL SUCCESS"

def install_ms():
	print "START INSTALL MS"
	os.system('/home/pm_install/upload_ms.sh')
	print "MS INSTALL SUCCESS"
def conf_ms():
	print "START CONFIGURE MS"
	ms_conf.mod_ip()
	print "MS CONFIGURE SUCCESS"

def install_ftpd():
	print "START INSTALL FTPDOWNLOAD"
	os.system('/home/pm_install/ftpdownload_install.sh')
	print 'FTPDOWNLOAD INSTALL SUCCESS'

def conf_ftpd():
	print "START CONFIGURE FTPDOWNLOAD"
	ftpdownload_conf.mod_conf()
	print "FTPDOWNLOAD CONFIGURE SUCCESS"

def install_vod():
	print "START INSTALL VOD"
	os.system('/home/pm_install/shell_script/server.sh')
	print "VOD INSTALL SUCCESS"


def	 conf_vod():
	print "START CONFIGURE VOD"
	vod_conf.mod_ip()
	print "VOD CONFIGURE  SUCCESS"

conf_ip()
install_yum_ntp ()
install_jdk ()
mysql_install()
import_databases()
install_tomcat()
conf_tomcat()
install_nginx()
install_ms()
conf_ms()
install_ftpd()
conf_ftpd()
install_vod()
conf_vod()
