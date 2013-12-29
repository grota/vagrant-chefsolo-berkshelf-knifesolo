What is this?
=============
This Repo is used only to show my experiments with Vagrant + Chef-solo + Berkshelf.  
Foodcritic and knife-solo have been used but can be regarded as _side dishes_.  
I followed the tutorial at <http://vialstudios.com/guide-authoring-cookbooks.html>.

Requirements
============
You need Vagrant, and the Berkshelf plugin (`vagrant plugin install vagrant-berkshelf`).

I defined an ssh config entry (`~/.ssh/config`): the name is `vagrantdef2222` and the content comes from `vagrant ssh-config`.

You can create a gemset and do a `bundle install`.

I wanted to use a provisioner-less base box so you need to run a `knife solo prepare vagrantdef2222` after a `vagrant up`.

Then you can run `vagrant provision` or `knife solo cook vagrantdef2222` to execute `chef solo`.
