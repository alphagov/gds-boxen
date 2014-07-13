class people::mattbostock {

  include chrome
  include gds_development
  include gds_resolver
  include gds_vpn_profiles
  include git
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include openconnect
  include screen
  include vagrant
  include virtualbox
  include zsh
  include ohmyzsh

  vagrant::plugin { 'vagrant-cachier': }

  include osx::disable_app_quarantine
  include osx::dock::autohide
  include osx::dock::dim_hidden_apps
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::no_network_dsstores

  osx::recovery_message { 'If found, please call 07917 173573': }

  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }
  class { 'osx::dock::icon_size': size => 40 }

  class security inherits boxen::security {
    Boxen::Osx_defaults['short delay for password dialog on screensaver'] {
      value  => 0,
    }
  }

  include security

  ## See modules/teams/manifests for things you can include here
  class { 'teams::infrastructure': manage_gitconfig => false }

  repository { "/Users/${::boxen_user}/dotfiles":
    source  => "${::github_login}/dotfiles",
  }

  homebrew::tap { 'thoughtbot/formulae': }

  ## This is how to install Homebrew packages
  ## You can get a list of your current packages with
  ## `brew list`
  package {
    [
      'autoconf',
      'autojump',
      'automake',
      'bash-completion',
      'brew-cask',
      'rcm',
      'wget',
    ]:
    ensure => present,
  }
}
