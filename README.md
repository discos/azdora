# AZDORA

This is a vagrant project used to setup the testing environment for Nuraghe/ESCS software packages. 

## Dependencies

On the host machine you will need to install:

  * [Oracle VirtualBox](https://www.virtualbox.org/)
  * [Vagrant](https://www.vagrantup.com/)

## Running

Clone this repository and put yourself inthe azdora durectory. 
You will need to insert correct IP address informations for the guest machine that we will create in these files: 
 
```
files/hosts
Vagrantfile
```

Once you insert the proper informations, from the *azdora* dir just run:

```bash
$ vagrant up 
```

This will download a base CentOS 5 32 bit virtual machine and run all the scripts used for ACS installation and basic configuration.
During the process you may be asked which network interface of the host machine to use, this is normal.


