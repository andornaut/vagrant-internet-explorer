# Vagrant configurations for Modern.ie

# Introduction
 
This repository contains configurations for [Modern.ie](http://modern.ie) vagrant [virtual machines](https://dev.windows.com/en-us/microsoft-edge/tools/vms/linux/). These 
configurations have been tested on Ubuntu Linux 15.04.

## Getting started

Install dependencies

	sudo apt-get install bsdtar redir ruby-childprocess ruby-domain-name ruby-erubis ruby-ffi ruby-http-cookie ruby-dev ruby-i18n ruby-listen ruby-log4r ruby-mime-types ruby-net-scp ruby-net-sftp ruby-net-ssh ruby-rb-inotify ruby-rest-client ruby-sqlite3 ruby-unf ruby-unf-ext
	sudo gem install winrm

Install Vagrant 1.7.4

	wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_i686.deb
	sudo dpkg -i vagrant_1.7.4_x86_64.deb
	sudo apt-get install vagrant-lxc

Start virtual machine

    cd vista-ie7
	vagrant up --provider virtualbox

(Optional) Connect with [winrm](https://docs.vagrantup.com/v2/vagrantfile/winrm_settings.html) (only works on some boxes)

	vagrant rdp
	
## Troubleshooting

By default the vagrant boxes are downloaded from [Atlas](https://atlas.hashicorp.com/modernIE/).
These downloads cannot be resumed, however, so if one fails you should execute
``rm -rf .vagrant/`` and then try again. Alternatively, you can download the boxes manually
from either Atlas or Akamai:

    # Atlas
    boxes="vista-ie7 w7-ie8 w7-ie9 w8-ie10 w8.1-ie11 w10-edge"
    for box in $boxes; do
        vagrant box add modernIE/$box https://atlas.hashicorp.com/modernIE/boxes/$box
    done
    
    # Akamai
    # n.b. The Akamai-hosted vagrant boxes may be out of date and there is no w10-edge box.
    # The box names are also different from those in Atlas, so if you use these you should
    # either rename the boxes or update the Vagrantfiles accordingly.
    boxes="vista-ie7 win7-ie8 win7-ie9 win8-ie10 win81-ie11"
    for box in $boxes; do
        vagrant box add modernIE/$box http://aka.ms/vagrant-$box
    done

## Links

[Example Vagrantfile](https://gist.github.com/andreptb/57e388df5e881937e62a)

[Vagrant boxes hosted by Atlas](https://atlas.hashicorp.com/modernIE/)

[Vagrant boxes hosted by Akamai](https://www.bram.us/2014/09/24/modern-ie-vagrant-boxes/)