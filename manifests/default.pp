## Vagrant :: Centos 6.5 64 bits + MongoDB 2.6 :: Puppet script ##

node 'centosmongo' {
    group { 'puppet': ensure => present }

    Exec {
        path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/', '/usr/local/bin/', '/usr/local/node/node-default/bin' ],
        logoutput => 'on_failure'
    }

    File { owner => 0, group => 0, mode => 0644 }

    # Mongo install
    # This should install mongodb server and client, in the system package latest version
    class {'::mongodb::globals':
        manage_package_repo => true,
        server_package_name => 'mongodb-org'
    }->
    class {'::mongodb::server': 
        journal => true,
    } ->
    class {'::mongodb::client': }
}

