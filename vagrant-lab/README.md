# Setup

This lab requires three linux hosts that can talk to each other. Vagrant configs are provided here but you could use any three linux hosts to do this.

## Install virtualbox and vagrant

https://www.virtualbox.org/wiki/Downloads

https://www.vagrantup.com/downloads.html

### Windows 10 Hyper-V

Note: I'm using Windows 10 and I had trouble with hyper-v. I disabled hyper-v at startup using `bcdedit` and rebooting.

```
bcdedit /set hypervisorlaunchtype off

shutdown /r /t 0
```

## Download debian box

```
vagrant box add debian/stretch64
```

# Start systems

Start each system by running `vagrant up` from each directory

```
salt-talk\vagrant-lab\master$ vagrant up
```

```
salt-talk\vagrant-lab\minion1$ vagrant up
```

```
salt-talk\vagrant-lab\minion2$ vagrant up
```
