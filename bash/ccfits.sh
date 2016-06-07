#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

CFITSIO=cfitsio3370.tar.gz
CCFITS=CCfits-2.4.tar.gz

echo "installing cfitsio"
if [ ! -f $BASEDIR/files/$CFITSIO ];
then
	echo "downloading cfitsio ..."
	cd $BASEDIR/files
	wget ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/$CFITSIO
fi
tar xzf $BASEDIR/files/$CFITSIO -C /tmp
cd /tmp/cfitsio
./configure --prefix=/usr/local
make
make install
cd $BASEDIR/files
rm -rf /tmp/cfitsio
echo "installing CCfits"
if [ ! -f $BASEDIR/files/$CCFITS ];
then
	echo "downloading CCfits ..."
	cd $BASEDIR/files
	wget http://heasarc.gsfc.nasa.gov/fitsio/CCfits/$CCFITS
fi
tar xzpf $BASEDIR/files/$CCFITS -C /tmp
cd /tmp/CCfits
./configure --prefix=/usr/local
make
make install
cd $BASEDIR
rm -rf /tmp/CCfits

