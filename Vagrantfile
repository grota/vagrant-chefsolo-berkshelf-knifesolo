# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "chef4-berkshelf"
  config.vm.box = "opscode-ubuntu-12.04-i386"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.define 'vagvmname' do |conf|
    conf.vm.network :forwarded_port, guest: 8080, host: 9090
    conf.berkshelf.enabled = true

    conf.vm.provision :chef_solo do |chef|
      chef.json = {
        :mysql => {
          :server_root_password => 'rootpass',
          :server_debian_password => 'debpass',
          :server_repl_password => 'replpass'
        }
      }

      # this takes precedence over node/xxx.json which is a file
      # that gets created when you run knife solo cook user@hostname
      chef.run_list = [
        "recipe[myface]"
      ]
    end
  end

end
