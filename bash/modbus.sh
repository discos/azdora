#!/bin/bash
MODBUS=libmodbus-3.0.6

echo "installing libmodbus"
if [ ! -f /vagrant/files/$MODBUS.tar.gz ];
then
	echo "downloading libmodbus ..."
	cd /vagrant/files
	wget http://libmodbus.org/releases/$MODBUS.tar.gz
fi
tar xzpf /vagrant/files/$MODBUS.tar.gz -C /tmp
cd /tmp/$MODBUS
./configure --prefix=/usr/local
make 
make install
cd ~
rm -rf /tmp/$MODBUS
