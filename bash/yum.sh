#!/bin/bash
echo "configuring yum and installing packages"
yum install -y epel-release
yum install -y vim-enhanced subversion python26 python26-devel \
               git jpackage-utils java-1.6.0-openjdk java-1.6.0-openjdk-devel \
               supervisor cfitsio gcc-c++ cmake ncurses ncurses-devel screen \
               expat expat-devel expect gsl gsl-devel \
               boost boost-devel \
               gnome-desktop gnome-desktop-devel
chkconfig yum-updatesd off
service yum-updatesd stop
