# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|


  # config.vm.box = "precise64"  # 12.04
  # config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  # config.vm.box = "raring64"  # 13.04
  # config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/raring/current/raring-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.box = "trusty64"  # 14.04
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.define "alerta", primary: true do |alerta|
    alerta.vm.network :private_network, ip: "192.168.0.100"
    alerta.vm.provision :shell, :path => "scripts/base.sh"
    alerta.vm.provision :shell, :path => "scripts/alerta.sh"
  end

  config.vm.define "alerta-nagios3" do |nagios3|
    nagios3.vm.network :private_network, ip: "192.168.0.101"
    nagios3.vm.provision :shell, :path => "scripts/base.sh"
    nagios3.vm.provision :shell, :path => "scripts/alerta.sh"
    nagios3.vm.provision :shell, :path => "scripts/nagios3.sh"
  end

  config.vm.define "alerta-zabbix" do |zabbix|
    zabbix.vm.network :private_network, ip: "192.168.0.102"
    zabbix.vm.provision :shell, :path => "scripts/base.sh"
    zabbix.vm.provision :shell, :path => "scripts/alerta.sh"
    zabbix.vm.provision :shell, :path => "scripts/zabbix.sh"
  end

  config.vm.define "alerta-riemann" do |riemann|
    riemann.vm.network :private_network, ip: "192.168.0.103"
    riemann.vm.provision :shell, :path => "scripts/base.sh"
    riemann.vm.provision :shell, :path => "scripts/alerta.sh"
    riemann.vm.provision :shell, :path => "scripts/riemann.sh"
  end

  config.vm.define "alerta-sensu" do |sensu|
    sensu.vm.network :private_network, ip: "192.168.0.104"
    sensu.vm.provision :shell, :path => "scripts/base.sh"
    sensu.vm.provision :shell, :path => "scripts/alerta.sh"
    sensu.vm.provision :shell, :path => "scripts/sensu.sh"
  end

  config.vm.define "alerta-kibana" do |kibana|
    kibana.vm.network :private_network, ip: "192.168.0.105"
    kibana.vm.provision :shell, :path => "scripts/base.sh"
    kibana.vm.provision :shell, :path => "scripts/alerta.sh"
    kibana.vm.provision :shell, :path => "scripts/kibana.sh"
  end

end
