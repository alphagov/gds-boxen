class zeus {
  ruby::gem {'zeus-1.8.7':
    gem     => 'zeus',
    ruby    => '1.8.7',
    require => Class['ruby::1_8_7'],
  }
  ruby::gem {'zeus-1.9.2':
    gem     => 'zeus',
    ruby    => '1.9.2',
    require => Class['ruby::1_9_2'],
  }
  ruby::gem {'zeus-1.9.3':
    gem     => 'zeus',
    ruby    => '1.9.3',
    require => Class['ruby::1_9_3'],
  }
}
