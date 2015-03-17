# -*- mode: ruby -*-
 
# vi: set ft=ruby :
 
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
 
VAGRANTFILE_API_VERSION = "2"
RAM_ASSIGNED = "256" 

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "centos6"
 
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.verbose = "yes"
  end
 
  # Node 1 
  config.vm.define "node1" do |node1|
 
    node1.vm.hostname = "node1"
    #node1.vm.provision :shell, path: "bootstrap1.sh"
    node1.vm.network :private_network, ip: "192.168.70.2"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", RAM_ASSIGNED]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
 
  # Node 2
  config.vm.define "node2" do |node2|
 
    node2.vm.hostname = "node2"
    #node2.vm.provision :shell, path: "bootstrap2.sh"
    node2.vm.network :private_network, ip: "192.168.70.3"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", RAM_ASSIGNED]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
 
  # Node 3
  config.vm.define "node3" do |node3|
 
    node3.vm.hostname = "node3"
    #node3.vm.provision :shell, path: "bootstrap3.sh" 
    node3.vm.network :private_network, ip: "192.168.70.4"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", RAM_ASSIGNED]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
 
end
