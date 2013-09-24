class gds_vpn_profiles {
  $profile_dir = '/opt/cisco/anyconnect/profile'

  file { $profile_dir:
    ensure  => directory,
    source  => 'puppet:///modules/gds_vpn_profiles/profile',
    recurse => true,
    purge   => true,
    notify  => Exec['restart/stop AnyConnect'],
  }

  # This is created automagically by SS endpoint.
  file { "${profile_dir}/CLIENT-VPN1_client_profile.xml":
    ensure => undef,
    owner  => undef,
    group  => undef,
  }

  exec { 'restart/stop AnyConnect':
    command     => 'pkill -1 -f AnyConnect',
    refreshonly => true,
  }
}
