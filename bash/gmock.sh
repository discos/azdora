#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

GMOCK=gmock-1.7.0
GMOCK_BASE_URL=https://googlemock.googlecode.com/files
BUILDDIR=build

echo "installing gmock"
if [ ! -f $BASEDIR/files/$GMOCK.zip ];
then
	echo "downloading $GMOCK.zip ..."
	cd $BASEDIR/files
        wget $GMOCK_BASE_URL/$GMOCK.zip
fi

unzip $BASEDIR/files/$GMOCK.zip
cd $BASEDIR/files/$GMOCK
export GMOCK_HOME=`pwd`
mkdir $BUILDDIR
cd $BUILDDIR
cmake ..
make
chmod a+x *.a
cp *.a /usr/local/lib
cd $GMOCK_HOME/include
cp -r gmock /usr/local/include
cd $GMOCK_HOME/gtest
mkdir $BUILDDIR
cd $BUILDDIR
cmake ..
make
chmod a+x *.a
cp *.a /usr/local/lib
cd $GMOCK_HOME/gtest/include
cp -r gtest /usr/local/include
cd $BASEDIR

