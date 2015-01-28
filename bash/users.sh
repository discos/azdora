#!/bin/bash
echo "adding groups"
/usr/sbin/groupadd  -g 335 acs

echo "adding users"
#/usr/sbin/useradd svnsync -r -d$SUBVERSION_HOME -M 
#echo svnsync:svnsync | /usr/sbin/chpasswd
/usr/sbin/useradd -g acs -n -u 3060 manager
echo manager:manager | /usr/sbin/chpasswd

exit 0
