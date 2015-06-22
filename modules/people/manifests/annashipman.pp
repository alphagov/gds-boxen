class people::annashipman {
  include chrome
  include gds_osx::turn_off_dashboard
  include gds_vpn_profiles
  include git
  include iterm2::stable
  include libreoffice
  include vagrant
  include gds_virtualbox
  include wget

  class { 'teams::infrastructure': manage_gitconfig => false }

  include projects::deployment::creds
  include projects::transition-config

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

package {
    [
      'python',
      'tmux',
    ]:
    ensure => present,
  }

  include osx::dock::autohide
  include osx::disable_app_quarantine
  include osx::global::natural_mouse_scrolling
  include osx::no_network_dsstore
}

