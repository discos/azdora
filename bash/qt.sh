#!/bin/bash
if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

QTVERSION=qt-4.5.2
QTURL=http://download.qt.io/archive/qt/4.5/qt-x11-opensource-src-4.5.2.tar.gz
QTFILE=qt-x11-opensource-src-4.5.2

echo "installing $QTVERSION"
if [ ! -f $BASEDIR/files/$QTFILE.tar.gz ];
then
	echo "downloading qt ..."
	cd $BASEDIR/files
	wget $QTURL
fi
tar xzf $BASEDIR/files/$QTFILE.tar.gz -C /tmp
cd /tmp/$QTFILE
./configure --prefix=/usr/local/$QTVERSION
make
make install
cd
rm -rf /tmp/$QTFILE

#this is for compatibility with old build scripts
ln -s /usr/local/$QTVERSION /usr/local/qt

echo "/usr/local/$QTVERSION" > /etc/ld.so.conf.d/qt4-i386.conf

