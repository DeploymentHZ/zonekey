import os
import update_ip


def conf_ip ():
     print "\33[32mConfigure ip address\n"
     update_ip.restart_ip()
     print "IP:%s"%ip
     print "IP ADDRESS SUCCESS\n"

def install_zj():
	print "START INSTALL VOD"
	os.system('/home/zj/shell_script/server.sh')
	print "VOD INSTALL SUCCESS"


conf_ip()
install_zj()