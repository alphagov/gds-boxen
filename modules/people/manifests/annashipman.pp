class people::annashipman {
  include chrome
  include gds_osx::turn_off_dashboard
  include gds_vpn_profiles
  include git
  include iterm2::stable
  include vagrant
  include gds_virtualbox
  include wget

  class { 'libreoffice':
    version => '4.3.7'
  }

  class { 'teams::infrastructure': manage_gitconfig => false }

  include projects::deployment::creds

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
      'ansible',
      'gpg-agent',
      'python',
      'tmux',
      'tree',
    ]:
    ensure => present,
  }

  include osx::no_network_dsstores
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::disable_app_quarantine
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::keyboard::capslock_to_control

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

}

