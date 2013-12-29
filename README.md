Notes
=====
This Repo is used only to show my experiments with Vagrant + Chef-solo + Berkshelf.  
Foodcritic and knife-solo have been used but can be regarded as _side dishes_.

Requirements
============
You need Vagrant, and the Berkshelf plugin (`vagrant plugin install vagrant-berkshelf`).

I used a ssh config alias with the name of `vagrantdef2222` and with the content from `vagrant ssh-config`.

You can then create a gemset and do a bundle install.

The vm is provisionless so you need to run a `knife solo prepare vagrantdef2222` after a `vagrant up`.

Then you can run `vagrant provision` or `knife solo cook vagrantdef2222`.

Launch Chef-Solo
================

`vagrant provision` uses the run\_list in the Vagrantfile.
`knife solo cook vagrantdef2222` uses knife solo to upload cookbooks and launch chef solo on the vagrant machine (see private repo's ssh config entry)
