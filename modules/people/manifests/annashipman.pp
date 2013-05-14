class people::annashipman {
  include chrome
  include git
  include iterm2::stable
  include libreoffice
  include postgresql
  include turn-off-dashboard
  include vagrant
  include virtualbox
  include wget

  include teams::infrastructure

  include projects::deployment
  include projects::redirector

  $home = "/Users/${::luser}"
  $projects = "${home}/projects"

  file { $projects:
    ensure  => directory,
  }

  $dotfiles = "${projects}/dotfiles"

  repository { $dotfiles:
    source  => 'annashipman/dotfiles',
    require => File[$projects],
    notify  => Exec['make-dotfiles'],
  }

  exec { 'make-dotfiles':
    cwd         => $dotfiles,
    command     => "make",
    refreshonly => true,
  }

  Boxen::Osx_defaults {
    user => $::luser,
  }

  boxen::osx_defaults { "Disable 'natural scrolling'":
    key    => 'com.apple.swipescrolldirection',
    domain => 'NSGlobalDomain',
    value  => 'false',
    type   => 'bool',
  }

package {
    [
      'python',
    ]:
    ensure => present,
  }
}
