# Vagrant configurations for Modern.ie

# Introduction
 
This repository contains configurations for [Modern.ie](http://modern.ie) vagrant [virtual machines](https://dev.windows.com/en-us/microsoft-edge/tools/vms/linux/). These 
configurations have been tested on Ubuntu Linux 15.04.

## Getting started

Install dependencies

	sudo apt-get install bsdtar redir ruby-childprocess ruby-domain-name ruby-erubis ruby-ffi ruby-http-cookie ruby-i18n ruby-listen ruby-log4r ruby-mime-types ruby-net-scp ruby-net-sftp ruby-net-ssh ruby-rb-inotify ruby-rest-client ruby-sqlite3 ruby-unf ruby-unf-ext
	sudo gem install winrm

Install Vagrant 1.7.4

	wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_i686.deb
	sudo dpkg -i vagrant_1.7.4_x86_64.deb
	sudo apt-get install vagrant-lxc

Start virtual machine

    cd vista-ie7
	vagrant up

(Optional) Connect with [winrm](https://docs.vagrantup.com/v2/vagrantfile/winrm_settings.html) (only works on some boxes)

	vagrant rdp

## Links

[Example Vagrantfile](https://gist.github.com/andreptb/57e388df5e881937e62a)