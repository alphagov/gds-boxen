class vagrant-dns {
  ruby::gem {'vagrant-dns-1.8.7':
    gem     => 'vagrant-dns',
    ruby    => '1.8.7',
    require => Class['ruby::1_8_7'],
    version => '0.2.4',
  }
  ruby::gem {'vagrant-dns-1.9.2':
    gem     => 'vagrant-dns',
    ruby    => '1.9.2',
    require => Class['ruby::1_9_2'],
    version => '0.2.4',
  }
  ruby::gem {'vagrant-dns-1.9.3':
    gem     => 'vagrant-dns',
    ruby    => '1.9.3',
    require => Class['ruby::1_9_3'],
    version => '0.2.4',
  }
  # vagrant-dns has a tacit dependency on daemons: 
  #   https://github.com/BerlinVagrant/vagrant-dns/issues/7
  ruby::gem {'daemons-1.8.7':
    gem     => 'daemons',
    ruby    => '1.8.7',
    require => Class['ruby::1_8_7'],
    version => '1.1.8',
  }
  ruby::gem {'daemons-1.9.2':
    gem     => 'daemons',
    ruby    => '1.9.2',
    require => Class['ruby::1_9_2'],
    version => '1.1.8',
  }
  ruby::gem {'daemons-1.9.3':
    gem     => 'daemons',
    ruby    => '1.9.3',
    require => Class['ruby::1_9_3'],
    version => '1.1.8',
  }
  ruby::gem {'rubydns-1.8.7':
    gem     => 'rubydns',
    ruby    => '1.8.7',
    require => Class['ruby::1_8_7'],
    version => '0.4.1',
  }
  ruby::gem {'rubydns-1.9.2':
    gem     => 'rubydns',
    ruby    => '1.9.2',
    require => Class['ruby::1_9_2'],
    version => '0.4.1',
  }
  ruby::gem {'rubydns-1.9.3':
    gem     => 'rubydns',
    ruby    => '1.9.3',
    require => Class['ruby::1_9_3'],
    version => '0.4.1',
  }
}
