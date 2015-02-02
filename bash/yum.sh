#!/bin/bash
echo "configuring yum and installing packages"
yum install -y epel-release
yum install -y vim-enhanced subversion python26 python26-devel \
               git jpackage-utils java-1.6.0-openjdk java-1.6.0-openjdk-devel \
               supervisor cfitsio gcc-c++ cmake ncurses ncurses-devel screen \
               expat expat-devel expect \
               gnome-desktop gnome-desktop-devel
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
cd /tmp
wget https://jenkins-ci.org/redhat/jenkins-ci.org.key
rpm --import jenkins-ci.org.key
rm jenkins-ci.org.key
yum install -y jenkins

