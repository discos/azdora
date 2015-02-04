#!/bin/bash
SIP=sip-4.11.2
SIPURL=http://downloads.sourceforge.net/project/pyqt/sip/sip-4.11.2/sip-4.11.2.tar.gz
PYQT=PyQt-x11-gpl-4.8.1
PYQWT=PyQwt-5.2.0
PYQWTURL=http://downloads.sourceforge.net/project/pyqwt/pyqwt5/PyQwt-5.2.0/PyQwt-5.2.0.tar.gz

echo "installing sip"
if [ ! -f /vagrant/files/$SIP.tar.gz ];
then 
	echo "downloading $SIP"
        cd /vagrant/files
        wget $SIPURL
fi
tar xzf /vagrant/files/$SIP.tar.gz -C /tmp
chown -R manager:acs /tmp/$SIP
su - manager -c "cd /tmp/$SIP; python configure.py"
su - manager -c "cd /tmp/$SIP; make"
su - manager -c "cd /tmp/$SIP; make install"
cd
rm -rf /tmp/$SIP

echo "installing numpy"
su - manager -c "pip install numpy==1.3.0 --insecure"

echo "installing PyQt"
tar xzf /vagrant/files/$PYQT.tar.gz -C /tmp
chown -R manager:acs /tmp/$PYQT
su - manager -c "cd /tmp/$PYQT; python configure.py"
su - manager -c "cd /tmp/$PYQT; make"
su - manager -c "cd /tmp/$PYQT; make install"
cd
rm -rf /tmp/$PYQT

echo "installing pyqwt"
if [ ! -f /vagrant/files/$PYQWT.tar.gz ];
then 
	echo "downloading $PYQWT"
        cd /vagrant/files
        wget $PYQWTURL
fi
tar xzf /vagrant/files/$PYQWT.tar.gz -C /tmp
chown -R manager:acs /tmp/$PYQWT
su - manager -c "cd /tmp/$PYQWT/configure; python configure.py -Q ../qwt-5.2"
su - manager -c "cd /tmp/$PYQWT/configure; make"
su - manager -c "cd /tmp/$PYQWT/configure; make install"
cd
rm -rf /tmp/$PYQWT

