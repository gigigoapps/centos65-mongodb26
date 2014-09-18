# -*- mode: ruby -*-
# vi: set ft=ruby :

## Vagrant :: Centos 6.5 64 bits + MongoDB 2.6 :: Vagrant File ##

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 

    config.vm.box = "puppetlabs/centos-6.5-64-puppet"

    # VM config
    config.vm.define :centosmongo do |centosmongo|
        centosmongo.vm.network :private_network, ip: "10.11.12.13"
        centosmongo.vm.network :forwarded_port, host: 27017, guest: 27017

        centosmongo.vm.hostname = "centosmongo"

        centosmongo.vm.provider 'virtualbox' do |v|
            v.customize ['modifyvm', :id, '--name', 'centos-6.5-64-puppet']
            v.customize ['modifyvm', :id, '--cpus', '1']
            v.customize ['modifyvm', :id, '--memory', 1024]
            v.customize ['modifyvm', :id, '--ioapic', 'off']
            v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
            v.customize ['modifyvm', :id, '--nictype1', 'virtio']
            v.customize ['modifyvm', :id, '--nictype2', 'virtio']
        end

        # Update package list
        centosmongo.vm.provision :shell, :inline => 'if [[ ! -f /yum-run ]]; then sudo yum check-update; sudo touch /yum-run; fi'

        # Puppet provision
        centosmongo.vm.provision :puppet do |puppet|
            puppet.manifests_path   = 'manifests'
            puppet.module_path      = 'modules'
            puppet.options          = ['--verbose']
        end
    end
end
