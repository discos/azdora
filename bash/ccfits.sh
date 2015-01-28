#!/bin/bash
CFITSIO=cfitsio3370.tar.gz
CCFITS=CCfits-2.4.tar.gz

echo "installing cfitsio"
if [ ! -f /vagrant/files/$CFITSIO ];
then
	echo "downloading cfitsio ..."
	cd /vagrant/files
	wget ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/$CFITSIO
fi
tar xzf /vagrant/files/$CFITSIO -C /tmp
cd /tmp/cfitsio
./configure --prefix=/usr/local
make
make install
cd /vagrant/files
rm -rf /tmp/cfitsio
echo "installing CCfits"
if [ ! -f /vagrant/files/$CCFITS ];
then
	echo "downloading CCfits ..."
	cd /vagrant/files
	wget http://heasarc.gsfc.nasa.gov/fitsio/CCfits/$CCFITS
fi
tar xzpf /vagrant/files/$CCFITS -C /tmp
cd /tmp/CCfits
./configure --prefix=/usr/local
make
make install
cd ~
rm -rf /tmp/CCfits
