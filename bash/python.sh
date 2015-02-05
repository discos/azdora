#!/bin/bash

if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

echo "setting up python2.6 environment"
curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python2.6
pip install -r $BASEDIR/files/requirements.txt
