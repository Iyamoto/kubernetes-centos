# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  config.vm.box = "centos/7"

  config.vm.define :master do |master|
    master.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]  	  
    end
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "10.100.100.10"
	master.vm.provision :shell, path: "scripts/bootstrap.sh"
  end

  config.vm.define :worker1 do |worker1|
    worker1.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    worker1.vm.hostname = "worker1"
    worker1.vm.network "private_network", ip: "10.100.100.11"
	worker1.vm.provision :shell, path: "scripts/bootstrap.sh"
  end

  config.vm.define :worker2 do |worker2|
    worker2.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
    worker2.vm.hostname = "worker2"
    worker2.vm.network "private_network", ip: "10.100.100.12"
	worker2.vm.provision :shell, path: "scripts/bootstrap.sh"
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

end
