class osx_resolver {
  file { '/etc/resolver':
    ensure => directory,
  }
}
