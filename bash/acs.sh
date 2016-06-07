#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

echo "installing ACS"
if [ -d /alma ];
then 
	echo "found /alma directory, skipping ACS extraction"
else
	if [ ! -f $BASEDIR/files/ACS.tar.gz ];
	then
		echo "downloading ACS ..."
		cd $BASEDIR/files
		wget ftp://ftp.eso.org/projects/almasw/acs/public/OldReleases/ACS-8_2_0/ACS.tar.gz
	fi
	echo "extracting ACS into /alma"
	tar xzpf $BASEDIR/files/ACS.tar.gz -C /
fi

echo "creating directory structure"
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
cp -r $BASEDIR/files/bashrc /home/manager/.bashrc
chown -R manager:acs /home/manager/.acs
chown -R manager:acs /home/manager/.bashrc

cd /system
su - manager -c "getTemplateForDirectory INTROOT /system/introot"

# SETTING UP MANAGER PYTHON ENVIRONMENT

su - manager -c "easy_install-2.5 pip==1.3.1"
cp $BASEDIR/files/manager_requirements.txt /tmp
chown manager:acs /tmp/manager_requirements.txt
su - manager -c "pip-2.5 --insecure install -r /tmp/manager_requirements.txt"
rm /tmp/manager_requirements.txt
cd $BASEDIR


