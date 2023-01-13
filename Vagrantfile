# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  N = 3 # max number of worker nodes
  Ver = '1.18.4' # Kubernetes Version to install

  #=============#
  # Master Node #
  #=============#

    config.vm.define "m-k8s" do |cfg|
      cfg.vm.box = "centos/7"
      cfg.vm.provider "virtualbox" do |vb|
        vb.name = "m-k8s(github_SysNet4Admin)"
        vb.cpus = 2
        vb.memory = 3072
      end
      cfg.vm.host_name = "m-k8s"
      cfg.vm.network "private_network", ip: "192.168.1.10"
      cfg.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: true, id: "ssh"
      cfg.vm.synced_folder "../data", "/vagrant", disabled: true 
      cfg.vm.provision "shell", path: "config.sh", args: N
      cfg.vm.provision "shell", path: "install_pkg.sh", args: [ Ver, "Main" ]
      cfg.vm.provision "shell", path: "master_node.sh"
    end

    config.vm.define "w1-k8s" do |cfg|
      cfg.vm.box = "centos/7"
      cfg.vm.provider "virtualbox" do |vb|
        vb.name = "w1-k8s(github_SysNet4Admin)"
        vb.cpus = 1
        vb.memory = 2560
      end
      cfg.vm.host_name = "w1-k8s"
      cfg.vm.network "private_network", ip: "192.168.1.101"
      cfg.vm.network "forwarded_port", guest: 22, host: "60101", auto_correct: true, id: "ssh"
      cfg.vm.synced_folder "../data", "/vagrant", disabled: true
      cfg.vm.provision "shell", path: "config.sh", args: N
      cfg.vm.provision "shell", path: "install_pkg.sh", args: Ver
      cfg.vm.provision "shell", path: "work_nodes.sh"
    end

    config.vm.define "w2-k8s" do |cfg|
      cfg.vm.box = "centos/7"
      cfg.vm.provider "virtualbox" do |vb|
        vb.name = "w2-k8s(github_SysNet4Admin)"
        vb.cpus = 1
        vb.memory = 2560
      end
      cfg.vm.host_name = "w2-k8s"
      cfg.vm.network "private_network", ip: "192.168.1.102"
      cfg.vm.network "forwarded_port", guest: 22, host: "60102", auto_correct: true, id: "ssh"
      cfg.vm.synced_folder "../data", "/vagrant", disabled: true
      cfg.vm.provision "shell", path: "config.sh", args: N
      cfg.vm.provision "shell", path: "install_pkg.sh", args: Ver
      cfg.vm.provision "shell", path: "work_nodes.sh"
    end

    config.vm.define "w3-k8s" do |cfg|
      cfg.vm.box = "centos/7"
      cfg.vm.provider "virtualbox" do |vb|
        vb.name = "w3-k8s(github_SysNet4Admin)"
        vb.cpus = 1
        vb.memory = 2560
      end
      cfg.vm.host_name = "w3-k8s"
      cfg.vm.network "private_network", ip: "192.168.1.103"
      cfg.vm.network "forwarded_port", guest: 22, host: "60103", auto_correct: true, id: "ssh"
      cfg.vm.synced_folder "../data", "/vagrant", disabled: true
      cfg.vm.provision "shell", path: "config.sh", args: N
      cfg.vm.provision "shell", path: "install_pkg.sh", args: Ver
      cfg.vm.provision "shell", path: "work_nodes.sh"
    end
end
