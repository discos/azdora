#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

MODBUS=libmodbus-3.0.6

echo "installing libmodbus"
if [ ! -f $BASEDIR/files/$MODBUS.tar.gz ];
then
	echo "downloading libmodbus ..."
	cd $BASEDIR/files
	wget http://libmodbus.org/releases/$MODBUS.tar.gz
fi
tar xzpf $BASEDIR/files/$MODBUS.tar.gz -C /tmp
cd /tmp/$MODBUS
./configure --prefix=/usr/local
make 
make install
cd $BASEDIR
rm -rf /tmp/$MODBUS
