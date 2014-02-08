class gds_vpn_profiles {

  $cisco_dir      = "/opt/cisco"
  $anyconnect_dir = "${cisco_dir}/anyconnect"
  $profile_dir    = "${anyconnect_dir}/profile"

  file {[$cisco_dir,$anyconnect_dir]:
    ensure => directory,
    owner  => 'root',
    group  => 'wheel',
    notify => File[$profile_dir],
  }

  file { $profile_dir:
    ensure  => directory,
    source  => 'puppet:///modules/gds_vpn_profiles/profile',
    recurse => true,
    purge   => true,
    owner   => 'root',
    group   => 'wheel',
    notify  => Exec['restart/stop AnyConnect'],
  }

  # This is created automagically by SS endpoint.
  file { "${profile_dir}/CLIENT-VPN1_client_profile.xml":
    ensure => undef,
    owner  => undef,
    group  => undef,
  }

  exec { 'restart/stop AnyConnect':
    command     => 'pkill -1 -f AnyConnect || true',
    refreshonly => true,
  }
}
