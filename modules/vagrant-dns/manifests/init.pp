class vagrant-dns {
  package { 'vagrant-dns':
    provider => gem,
    ensure   => '0.2.4',
  }

  ruby::gem {'vagrant-dns-1.8.7':
    gem     => 'vagrant-dns',
    ruby    => '1.8.7',
    require => Class['ruby::1-8-7'],
    version => '0.2.4',
  }
  ruby::gem {'vagrant-dns-1.9.2':
    gem     => 'vagrant-dns',
    ruby    => '1.9.2',
    require => Class['ruby::1-9-2'],
    version => '0.2.4',
  }
  ruby::gem {'vagrant-dns-1.9.3':
    gem     => 'vagrant-dns',
    ruby    => '1.9.3',
    require => Class['ruby::1-9-3'],
    version => '0.2.4',
  }

}
