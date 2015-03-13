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
tar xzvf $BASEDIR/files/jenkins-backup.tar.gz -C /home/manager 
#rm -rf /var/lib/jenkins
#tar xzfp $BASEDIR/files/var.lib.jenkins -C /var/lib
chown -R manager:acs /var/lib/jenkins
chown -R manager:acs /var/log/jenkins
chown -R manager:acs /var/cache/jenkins
chown -R manager:acs /home/manager/azdora-backups

/sbin/service jenkins restart

sleep 30
cd
wget http://127.0.0.1:8080/azdora/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar -s http://127.0.0.1:8080/azdora/ install-plugin thinbackup -deploy

echo "remember to install THINBACKUP plugin and enable backups in /home/manager/azdora-backups" 1>&2 
