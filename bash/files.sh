#!/bin/bash

echo "Copying configuration files"
cp /vagrant/files/env.sh /etc/profile.d/azdora.sh
source /etc/profile.d/azdora.sh
cp /vagrant/files/hosts /etc/hosts
cp /vagrant/files/resolv.conf /etc/resolv.conf
