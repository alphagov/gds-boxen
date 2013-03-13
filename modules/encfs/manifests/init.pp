class encfs {
  include fuse

  package { 'encfs':
    ensure  => present,
    require => Class['fuse'],
  }
}
