# Setup

This lab requires three linux hosts that can talk to each other. Vagrant configs are provided here but you could use any three linux hosts to do this.

## Install virtualbox and vagrant

https://www.virtualbox.org/wiki/Downloads

https://www.vagrantup.com/downloads.html

### Windows 10 Hyper-V

Note: I'm using Windows 10 and I had trouble with hyper-v. I disabled hyper-v at startup by using `bcdedit` and rebooting.

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
salt-talk/lab/master$ vagrant up
```

```
salt-talk/lab/minion1$ vagrant up
```

```
salt-talk/lab/minion2$ vagrant up
```

# Install salt master

ssh to master and install curl and salt master using the bootstrap script

```
salt-talk/lab/master$ vagrant ssh
vagrant@salt:~$ sudo apt install curl
vagrant@salt:~$ curl -L https://bootstrap.saltstack.com -o install_salt.sh
vagrant@salt:~$ sudo sh install_salt.sh -P -M
```

# Install salt minions

On each minion install curl and salt minion using the same bootstrap script with different options (no `-M` for master)

```
salt-talk/lab/minion1$ vagrant ssh
vagrant@minion1:~$ sudo apt install curl
vagrant@minion1:~$ curl -L https://bootstrap.saltstack.com -o install_salt.sh
vagrant@minion1:~$ sudo sh install_salt.sh -P
```

Do the same for minion2

Note: If you are not using the vagrant files provided and your minions do not resolve the hostname `salt` to the master host, you can specify the master's hostname at installation using `-A {master name or IP}`

On master if not using "salt" as master hostname
```
sudo sh install_salt.sh -P -M -A "$(hostname)"
```

On minions if not using "salt" as master hostname
```
sudo sh install_salt.sh -P -A {master name or IP}
```

# Accept keys

Salt uses asymmetric key pairs to authenticate the master and minion. The minions automatically accepts the master's key. You must accept the minion's keys on the master.

```
vagrant@salt:~$ sudo salt-key --list-all
```
```
vagrant@salt:~$ sudo salt-key --accept-all
```

# Test connectivity

```
vagrant@salt:~$ sudo salt '*' test.ping
```

## sudo aliases

Save yourself some time and instead of typing `sudo` in front of every `salt` command make aliases for them on the master. Edit your `.bashrc` file and add the following:

```
alias salt="sudo salt"
alias salt-call="sudo salt-call"
alias salt-cp="sudo salt-cp"
alias salt-key="sudo salt-key"
alias salt-master="sudo salt-master"
alias salt-minion="sudo salt-minion"
alias salt-proxy="sudo salt-proxy"
alias salt-run="sudo salt-run"
alias salt-unity="sudo salt-unity"
```