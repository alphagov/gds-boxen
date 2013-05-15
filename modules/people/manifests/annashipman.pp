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

  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }

package {
    [
      'python',
      'pwgen',
      'tmux',
    ]:
    ensure => present,
  }

  include osx::dock::autohide
  include osx::disable_app_quarantine
}

