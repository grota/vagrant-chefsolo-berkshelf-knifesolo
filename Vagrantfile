# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "chef4-berkshelf"
  config.vm.box = "opscode-ubuntu-12.04-i386"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"
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
        "recipe[myface::database]",
        "recipe[myface::default]",
      ]
      # vagrant puts this file in /tmp/encrypted_data_bag_secret
      chef.encrypted_data_bag_secret_key_path = 'some_key_file'

      # I need to set this to a string this otherwise ruby complains
      # because someone (Berkshelf?) sets this as an array.
      # Vagrants mounts this as an additional shared folder
      chef.data_bags_path = 'data_bags'
    end
  end

end
