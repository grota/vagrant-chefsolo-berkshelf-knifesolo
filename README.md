grota's NOTE
============
Repo used to show how Berkshelf and knife-solo interact with Vagrant

Launch Chef-Solo
================

`vagrant provision` uses the run\_list in the Vagrantfile.
`knife solo cook vagrantdef2222` uses knife solo to upload cookbooks and launch chef solo on the vagrant machine (see private repo's ssh config entry)
