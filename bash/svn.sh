#!/bin/bash
if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

SVNROOT=/data/ACS
mkdir -p $SVNROOT
chown -R manager:acs /data
chown -R manager:acs $SVNROOT

#echo "checking out Nuraghe and ESCS"
#su - manager
#cd $SVNROOT
#svn co belzebu/repos/ACS .
