# Install fuse4x and the kernel extension. Does not currently handle
# upgrades from one version to another.
#
class fuse {
  package { 'fuse4x-kext':
    ensure => present,
    notify  => Exec['copy fuse4x.kext'],
  }
  package { 'fuse4x':
    ensure  => present,
    require => Package['fuse4x-kext'],
  }

  # Command substitution selects the latest installed version.
  exec { 'copy fuse4x.kext':
    user        => 'root',
    command     => "cp -rfX \
\$(ls -dt ${::boxen_home}/homebrew/Cellar/fuse4x-kext/*/Library/Extensions/fuse4x.kext | head -n1) \
/Library/Extensions",
    creates     => '/Library/Extensions/fuse4x.kext',
  }

  file { '/Library/Extensions/fuse4x.kext/Support/load_fuse4x':
    ensure  => undef,
    owner   => 'root',
    group   => 'wheel',
    mode    => '4755',
    require => Exec['copy fuse4x.kext'],
  }
}
