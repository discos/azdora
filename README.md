# AZDORA

This is a vagrant project used to setup the testing environment for *DISCOS* software packages. 

## Dependencies

On the host machine you will need to install:

  * [Oracle VirtualBox](https://www.virtualbox.org/)
  * [Vagrant](https://www.vagrantup.com/) (also installable via yum or apt)

## Customization

Clone this repository and put yourself in the azdora directory. 
*Vagrantfile* holds all the VM configuration parameters and in the last
session you can ses a list of bash scripts which will be executed after
OS installation:

```ruby
  config.vm.provision "shell", path: "bash/files.sh"
  config.vm.provision "shell", path: "bash/users.sh"
  config.vm.provision "shell", path: "bash/yum.sh"
  config.vm.provision "shell", path: "bash/python.sh"
  config.vm.provision "shell", path: "bash/ccfits.sh"
  config.vm.provision "shell", path: "bash/modbus.sh"
  config.vm.provision "shell", path: "bash/gmock.sh"
  config.vm.provision "shell", path: "bash/f2c.sh"
  config.vm.provision "shell", path: "bash/misc.sh"
  config.vm.provision "shell", path: "bash/acs.sh"
  config.vm.provision "shell", path: "bash/svn.sh"
  config.vm.provision "shell", path: "bash/qt.sh"
  config.vm.provision "shell", path: "bash/pyqt.sh"
  config.vm.provision "shell", path: "bash/jenkins.sh"
```

**Order matters here** and there is no dependency check, so pay attention
to how bash scripts are executed one after the other! 

You can customize the scripts you find in
the *bash* directory to your needs but in principle everything
should just run fine.

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

## Running in local system
Azdora can also be used to install DISCOS on a local system where OS is already installed without using
any vagrant facility i.e. a plain old physical machine.
You can use the provided script  **provision.sh** to run all the provisioning scripts on a running system. By default the script will not install jenkins and the qt4 environment, just uncomment those lines if you want a complete azdora installation. 
The script must be run as root:

```bash
[root@azdora vagrant]# ls
bash  files  provision.sh  README.md  Vagrantfile
[root@azdora vagrant]# whoami
root
[root@azdora vagrant]# bash provision.sh 
```


