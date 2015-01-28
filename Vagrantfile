# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "puppetlabs/centos-5.11-32-nocm"
  config.vm.box_url = "https://atlas.hashicorp.com/puppetlabs/boxes/centos-5.11-32-nocm"
  config.vm.box_check_update = false

  config.vm.hostname = "azdora"
  ##########################################################
  # Insert here your IP informations
  #  
  # ip: is the ip that will have the guest machine
  # bridge: is the host interface name you want to bridge
  #
  # ########################################################
  config.vm.network "public_network", ip: "192.168.30.45", bridge: "eth0"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 80, host: 8081

  config.vm.provider "virtualbox" do |vb|
    vb.name = "azdora"
    vb.memory = "4096"
    vb.cpus = 2
  end
  config.vm.provision "shell", path: "bash/misc.sh"
  config.vm.provision "shell", path: "bash/files.sh"
  config.vm.provision "shell", path: "bash/users.sh"
  config.vm.provision "shell", path: "bash/networking.sh"
  config.vm.provision "shell", path: "bash/yum.sh"
  config.vm.provision "shell", path: "bash/python.sh"
  config.vm.provision "shell", path: "bash/ccfits.sh"
  config.vm.provision "shell", path: "bash/modbus.sh"
  config.vm.provision "shell", path: "bash/gmock.sh"
  config.vm.provision "shell", path: "bash/svn.sh"
  config.vm.provision "shell", path: "bash/acs.sh"
end
