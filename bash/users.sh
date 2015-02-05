#!/bin/bash
if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

echo "adding groups"
/usr/sbin/groupadd  -g 335 acs

echo "adding users"
/usr/sbin/useradd -g acs -n -u 3060 manager
#Password for manager is: manager
echo manager:manager | /usr/sbin/chpasswd

exit 0
