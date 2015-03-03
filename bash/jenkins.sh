#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
cd /tmp
wget https://jenkins-ci.org/redhat/jenkins-ci.org.key
rpm --import jenkins-ci.org.key
rm jenkins-ci.org.key
yum install -y jenkins

cp $BASEDIR/files/etc.sysconfig.jenkins /etc/sysconfig/jenkins
tar xzvf -C /home/manager $BASEDIR/jenkins-backup.tar.gz
rm -rf /var/lib/jenkins
tar xzfp $BASEDIR/files/var.lib.jenkins -C /var/lib
chown -R manager:acs /var/lib/jenkins
chown -R manager:acs /var/log/jenkins
chown -R manager:acs /var/cache/jenkins
chown -R manager:acs /home/manager/azdora-backups

/sbin/service jenkins restart

