#!/bin/bash

echo "setting up python2.6 environment"
curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python2.6
pip install -r /vagrant/files/requirements.txt
