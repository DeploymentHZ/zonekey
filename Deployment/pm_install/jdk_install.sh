#!/bin/bash
yum -y install java-1.7.0-openjdk*
a=`java -version 2>/tmp/java.tmp && grep "java version" /tmp/java.tmp|awk -F " " '{print $3}'`
b='"1.7.0_75"'
if [ $a == $b ]
then
   echo OK
else
   echo null
fi
