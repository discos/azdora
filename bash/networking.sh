#!/bin/bash

echo "adding default route"
route add default gw 192.168.30.1
service network restart

