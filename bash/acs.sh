#!/bin/bash

echo "installing ACS"
if [ -d /alma ];
then 
	echo "found /alma directory, skipping ACS extraction"
else
	if [ ! -f /vagrant/files/ACS.tar.gz ];
	then
		echo "downloading ACS ..."
		cd /vagrant/files
		wget ftp://ftp.eso.org/projects/almasw/acs/public/OldReleases/ACS-8_2_0/ACS.tar.gz
	fi
	echo "extracting ACS into /alma"
	tar xzpf /vagrant/files/ACS.tar.gz -C /
fi

echo "creating directiry structure"
mkdir -p /system
mkdir -p /system/configuration
mkdir -p /system/docroot
mkdir -p /system/sources
mkdir -p /system/userbin
mkdir -p /archive
mkdir -p /archive/data
mkdir -p /archive/schedules
mkdir -p /archive/logs
mkdir -p /archive/events
mkdir -p /archive/extraData
chown -R manager:acs /alma
chown -R manager:acs /system
chown -R manager:acs /archive

echo "setting up enironment for user manager"
cp -r /alma/ACS-8.2/ACSSW/config/.acs /home/manager/
cp -r /vagrant/files/bashrc /home/manager/.bashrc
chown -R manager:acs /home/manager/.acs
chown -R manager:acs /home/manager/.bashrc

cd /system
su - manager -c "getTemplateForDirectory INTROOT /system/introot"
#su - manager -c "mkdir -p /system/introot/ALARMS"
#su - manager -c "mkdir -p /system/introot/ERRORS"
#su - manager -c "mkdir -p /system/introot/LOGS"
#su - manager -c "mkdir -p /system/introot/CDT"
cd ~

# SETTING UP MANAGER PYTHON ENVIRONMENT

su - manager -c "easy_install-2.5 pip==1.3.1"
su - manager -c "pip-2.5 --insecure install -r /vagrant/files/manager_requirements.txt"

