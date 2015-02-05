#!/bin/bash
##################################################
# This script can be used in order
# to install the whole ACS system on 
# an already installed OS without using
# Vagrant virtual machines.
#
# This script must run with root privileges
##################################################

if [ -z "$1" ];
then
    BASEDIR=`pwd`
else
    BASEDIR=$1
fi

. bash/files.sh $BASEDIR
. bash/users.sh $BASEDIR
. bash/yum.sh $BASEDIR
. bash/python.sh $BASEDIR
. bash/ccfits.sh $BASEDIR
. bash/modbus.sh $BASEDIR
. bash/gmock.sh $BASEDIR
. bash/f2c.sh $BASEDIR
. bash/svn.sh $BASEDIR
#. bash/jenkins.sh $BASEDIR
. bash/misc.sh $BASEDIR
. bash/acs.sh $BASEDIR
#. bash/qt.sh $BASEDIR
#. bash/pyqt.sh $BASEDIR
