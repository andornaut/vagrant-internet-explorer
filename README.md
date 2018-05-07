# Vagrant Internet Explorer (and Edge) boxes

A collection of Vagrant configurations that can be used to run various
versions of Internet Explorer (or Microsoft Edge) on Microsoft Windows.

## Getting Started

1. Install the dependencies: `sudo apt-get install vagrant virtualbox`
1. Select a version of Internet Explorer or Microsoft Edge: `cd ie11`
1. Start the corresponding Vagrant box: `vagrant up`

## Troubleshooting

If you encounter an error such as:

> The box failed to unpackage properly. Please verify that the box
file you're trying to add is not corrupted and that enough disk space
is available and then try again.
The output from attempting to unpackage (if any):
> 
> bsdtar: Invalid central directory signature
> bsdtar: Error exit delayed from previous errors.

Then you can try the following workaround:

1. Set a couple of variables. 

```bash
box=ie11
url='http://aka.ms/ie11.win81.vagrant'
```

- The `box` variable should match one of the directories in the root of this project.
- The `url` variable should be chosen from among this list:
  - http://aka.ms/ie6.xp.vagrant
  - http://aka.ms/ie8.xp.vagrant
  - http://aka.ms/ie7.vista.vagrant
  - http://aka.ms/ie8.win7.vagrant
  - http://aka.ms/ie9.win7.vagrant
  - http://aka.ms/ie10.win7.vagrant
  - http://aka.ms/ie11.win7.vagrant
  - http://aka.ms/ie10.win8.vagrant
  - http://aka.ms/ie11.win81.vagrant
  - http://aka.ms/msedge.win10.vagrant

2. Run the following script:

```bash
cd ${box}
wget --output-file=${box}.zip ${url}
unzip ${box}.zip
rm ${box}.zip
mv *.box ${box}.box
vagrant up # This will install the local ${box}.box file instead of attempting to download it.
```

## Resources

- [modernIE (Deprecated)](https://app.vagrantup.com/modernIE)
- [Official Microsoft Edge on Windows 10 Vagrant box](https://app.vagrantup.com/Microsoft/boxes/EdgeOnWindows10)
- [Vagrantbox.es](http://www.vagrantbox.es/)
- [Vagrantfile gist](https://gist.github.com/anthonysterling/7cb85670b36821122a4a)
