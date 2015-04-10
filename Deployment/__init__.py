__author__ = 'hou'
#!/bin/bash
filename=`find /home/soft -name *.sql|awk -F "/" '{print $4}'|awk -F "." '{print $1}'`
mysqladmin -uroot password $filename
mysql -u root -p $filename < /home/soft/$filename.sql