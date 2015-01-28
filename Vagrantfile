# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-hostmanager") then
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
  end

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :private_network, ip: "192.168.33.120"
  config.vm.hostname = "gollum.dev.com"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "deployment/vagrant.yml"
    ansible.inventory_path = "deployment/hosts"
    ansible.limit = "development"
    #ansible.tags = ['deploy_gollum', 'rebuild_gollum', 'restart_gollum']
    #ansible.verbose = 'vvvv'
  end
  
end
