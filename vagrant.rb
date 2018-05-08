# -*- mode: ruby -*-
# vi: set ft=ruby :

boxes = {
  "ie6"  => "http://aka.ms/vagrant-xp-ie6",
  "ie7"  => "http://aka.ms/ie7.vista.vagrant",
  "ie8"  => "http://aka.ms/ie8.win7.vagrant",
  "ie9"  => "http://aka.ms/ie9.win7.vagrant",
  "ie10" => "http://aka.ms/ie10.win8.vagrant",
  "ie11" => "http://aka.ms/ie11.win81.vagrant",
  "msedge" => "http://aka.ms/msedge.win10.vagrant",
}

// This script is required by `Vagrantfile` files in subdirectories of this one - such as ``./ie11` - which correspond
// to `box` values such as "ie11"
box = File.basename(Dir.getwd)
remote_url = boxes[box]
local_path = box + '.box'
// Install a local box file if one exists eg. `ie11.box`, otherwise download the box file from `remote _url`.
box_url = File.file?(local_path) ? local_path : remote_url

Vagrant.configure("2") do |config|
  config.vm.box = box
  config.vm.box_url = box_url
  config.vm.boot_timeout = 1
  config.vm.guest = :windows
  config.vm.hostname = "#{`hostname`[0..-2]}".sub(/\..*$/,'') + box
  config.vm.provider "virtualbox" do |vm|
    vm.gui = true
    vm.customize ["modifyvm", :id, "--vram", "256"]
    vm.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vm.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
  end
end
