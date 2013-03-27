require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

define ruby::all::gem (
    $version = undef
  ){
  ruby::gem {"${name}-1.8.7":
    gem     => $name,
    ruby    => '1.8.7',
    require => Class['ruby::1_8_7'],
    version => $version,
  }
  ruby::gem {"${name}-1.9.2":
    gem     => $name,
    ruby    => '1.9.2',
    require => Class['ruby::1_9_2'],
    version => $version,
  }
  ruby::gem {"${name}-1.9.3":
    gem     => $name,
    ruby    => '1.9.3',
    require => Class['ruby::1_9_3'],
    version => $version,
  }
}

node default {
  # core modules, needed for most things
  include git
  include hub
  include ruby

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::0-4
  include nodejs::0-6
  include nodejs::0-8

  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/gds-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  git::config::global { 'hub.host':
    value => 'github.gds',
  }

}
