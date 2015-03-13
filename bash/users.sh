#!/bin/bash
if [ -z "$1" ];
then
    BASEDIR=/vagrant
else
    BASEDIR=$1
fi

echo "adding groups"
/usr/sbin/groupadd  -g 335 acs

echo "adding users"
/usr/sbin/useradd -g acs -n -u 3060 manager
#Password for manager is: manager
echo manager:manager | /usr/sbin/chpasswd
echo "generating new public key for user manager"
su - manager -c "ssh-keygen -q -f ~/.ssh/id_rsa -t rsa -N \"\""
cp /home/manager/.ssh/id_rsa.pub /vagrant/files/vm_manager_public_key.pub

exit 0
