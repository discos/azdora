#!/bin/bash

cp files/ets.sysconfig.jenkins /etc/sysconfig/jenkins
chown -R manager:acs /var/lib/jenkins
chown -R manager:acs /var/log/jenkins
chown -R manager:acs /var/cache/jenkins

/sbin/service jenkins restart

