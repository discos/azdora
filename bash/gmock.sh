#!/bin/bash
GMOCK=gmock-1.7.0
GMOCK_BASE_URL=https://googlemock.googlecode.com/files
BUILDDIR=build
TMPDIR=`mktemp -d`
cd $TMPDIR
wget $GMOCK_BASE_URL/$GMOCK.zip
unzip $GMOCK.zip
cd $GMOCK
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
cd ~
rm -rf $TMPDIR

