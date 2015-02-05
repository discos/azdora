#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

echo "installing f2c headers"
cd $BASEDIR/files

if [ -d $BASEDIR/files/f2c ];
then
	echo "found f2c directory"
else
	echo "downloading f2c sources"
	rsync -avz netlib.org::netlib/f2c/src f2c
fi
cd f2c/src
chmod a+x xsum
cp makefile.u Makefile
make
cp f2c.h /usr/local/include
cp f2c /usr/local/bin
cd


