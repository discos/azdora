#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

cp $BASEDIR/files/etc.sysconfig.jenkins /etc/sysconfig/jenkins
rm -rf /var/lib/jenkins
tar xzfp $BASEDIR/files/var.lib.jenkins -C /var/lib
chown -R manager:acs /var/lib/jenkins
chown -R manager:acs /var/log/jenkins
chown -R manager:acs /var/cache/jenkins

/sbin/service jenkins restart

