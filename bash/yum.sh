#!/bin/bash
echo "configuring yum and installing packages"
yum install -y epel-release
yum install -y vim-enhanced subversion python26 python26-devel git jpackage-utils java-1.6.0-openjdk supervisor cfitsio gcc-c++
