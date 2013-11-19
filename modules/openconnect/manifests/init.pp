class openconnect {

    sudoers { 'tuntap-installer':
      users    => $::boxen_user,
      hosts    => 'ALL',
      commands => [
      '(ALL) NOPASSWD : /usr/bin/tuntap-installer',
      ],
      type     => 'user_spec',
     }

    package { 'openconnect':
      ensure => present,
    }

    package { 'tuntap':
      ensure  => present,
      require => File['/usr/bin/tuntap-installer'],
      notify  => Exec['install-tuntap'],
    }

    file {'/usr/bin/tuntap-installer':
      source => 'puppet:///modules/openconnect/tuntap-installer',
      ensure => present,
      mode   => '0755',
    }

    exec {'install-tuntap':
      command     => 'sudo /usr/bin/tuntap-installer',
      refreshonly => true,
      require     => Sudoers['tuntap-installer'],
    }

}
