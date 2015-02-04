# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-5.11-32-nocm"
  config.vm.box_url = "https://atlas.hashicorp.com/puppetlabs/boxes/centos-5.11-32-nocm"
  config.vm.box_check_update = false

  config.vm.hostname = "azdora"
  config.vm.network "private_network", ip: "10.0.2.15"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 80, host: 8081

  config.vm.provider "virtualbox" do |vb|
    vb.name = "azdora"
    vb.memory = "4096"
    vb.cpus = 2
  end
  config.vm.provision "shell", path: "bash/files.sh"
  config.vm.provision "shell", path: "bash/users.sh"
  config.vm.provision "shell", path: "bash/yum.sh"
  config.vm.provision "shell", path: "bash/python.sh"
  config.vm.provision "shell", path: "bash/ccfits.sh"
  config.vm.provision "shell", path: "bash/modbus.sh"
  config.vm.provision "shell", path: "bash/gmock.sh"
  config.vm.provision "shell", path: "bash/f2c.sh"
  config.vm.provision "shell", path: "bash/svn.sh"
  config.vm.provision "shell", path: "bash/jenkins.sh"
  config.vm.provision "shell", path: "bash/misc.sh"
  config.vm.provision "shell", path: "bash/acs.sh"
  #########################################################
  #
  # Ci mette circa un ora a compilare e installare le qt
  # lo script è comunque disponibile in:
  # /vagrant/bash/qt.sh
  # Va eseguito dopo l'installazione di ACS
  #
  #config.vm.provision "shell", path: "bash/qt.sh"
  #config.vm.provision "shell", path: "bash/pyqt.sh"
end
