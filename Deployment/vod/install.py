import os
import update_ip


def conf_ip ():
     print "\33[32mConfigure ip address\n"
     update_ip.restart_ip()
     print "IP:%s"%ip
     print "IP ADDRESS SUCCESS\n"

def install_nginx():
	print "START INSTALL NGINX"
	os.system('/home/vod/nginx_install.sh')
	print "NGINX INSTALL SUCCESS"


def install_nfs():
    print "START INSTALL NFS"
    os.system('/home/vod/nfs_install.sh')
    print "NFS INSTALL SUCCESS"
conf_ip()
install_nfs()
install_nginx()