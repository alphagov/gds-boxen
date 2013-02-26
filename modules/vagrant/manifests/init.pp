class vagrant {
  ruby::gem {'vagrant-1.8.7':
    gem     => 'vagrant',
    ruby    => '1.8.7',
    require => Class['ruby::1_8_7'],
  }
  ruby::gem {'vagrant-1.9.2':
    gem     => 'vagrant',
    ruby    => '1.9.2',
    require => Class['ruby::1_9_2'],
  }
  ruby::gem {'vagrant-1.9.3':
    gem     => 'vagrant',
    ruby    => '1.9.3',
    require => Class['ruby::1_9_3'],
  }
}
