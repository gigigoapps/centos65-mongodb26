# Vagrant :: Centos 6.5 64 bits + MongoDB 2.6

This project uses Vagrant to mount and deploy a test environment with Centos 6.5 64 bits and MongoDB 2.6

## Requisites

### You will need:

  * Git 1.7+
  * Vagrant v1.6.5 + (http://vagrantup.com)
  * Virtualbox v4.3.16 + (https://www.virtualbox.org/)

## Do the work

### Clone this repositoriy with submodules (they are puppet submodules)

    $ git clone --recursive https://github.com/pedroamador/centos65-mongodb26
    [...]
    $ cd centos65-mongodb26
    [...]

### Start the VM

    centos65-mongodb26$ vagrant up
    Bringing machine 'centosmongo' up with 'virtualbox' provider...
    ==> centosmongo: Importing base box 'puppetlabs/centos-6.5-64-puppet'...
    ==> centosmongo: Matching MAC address for NAT networking...
    ==> centosmongo: Checking if box 'puppetlabs/centos-6.5-64-puppet' is up to date...
    [...]

### Access to the VM

You can go to VM "inside" with shell prompt in console mode, and then access to the "mongo" server

    centos65-mongodb26$ vagrant ssh
    monLast login: Thu Sep 18 06:29:58 2014 from 10.0.2.2
    mon[vagrant@centosmongo ~]$ mongo
    MongoDB shell version: 2.6.4
    connecting to: test
    Welcome to the MongoDB shell.
    For interactive help, type "help".
    For more comprehensive documentation, see
	    http://docs.mongodb.org/
    Questions? Try the support group
	    http://groups.google.com/group/mongodb-user
    > 

With "vagrant ssh" you are logged in the VM with "vagrant" user. 
But you can enter `sudo -i` command to became "root" user
Or you can also exec `sudo [command]` commands.

---

## Notes

---

## Known issues

---

## ToDo

