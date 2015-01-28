# AZDORA

This is a vagrant project used to setup the testing environment for Nuraghe/ESCS software packages. 

## Dependencies

On the host machine you will need to install:

  * [Oracle VirtualBox](https://www.virtualbox.org/)
  * [Vagrant](https://www.vagrantup.com/) (also installable via yum or apt)

## Customization

Clone this repository and put yourself inthe azdora durectory. 
You will need to insert correct IP address informations for the guest machine that we will create in these files: 
 
```
files/hosts
Vagrantfile
```

Network configuration must be tweaked also in:

```
files/resolv.conf
bash/networking.sh
```

If you already have ACS.tar.gz package for ACS-8.2 you can copy it in the files directory, otherwise it will be downloaded from the internet (this may take some time). This is also valid for *CCfits-2.4.tar.gz  cfitsio3370.tar.gz libmodbus-3.0.6.tar.gz*

## Installation

Once you have everything setup, from the *azdora* dir just run:

```bash
$ vagrant up 
```

This will download a base CentOS 5 32 bit virtual machine and run all the scripts used for ACS installation and basic configuration.
During the process you may be asked which network interface of the host machine to use, this is normal, answer freely but remember that the VM will need internet access. From Medicina it took 4 minutes to have a running ACS instance from scratch!

## Running

Use **vagrant** commands to start/stop/access the virtual machine, briefly:

  * **vagrant up** starts the VM
  * **vagrant suspend** suspends the VM
  * **vagrant ssh** logs into the VM as user *vagrant* who can *sudo* with no password
  * **vagrant provision** re-run the installation scripts on a running VM

You can read the full vagrant documentation at http://vagrantup.com

