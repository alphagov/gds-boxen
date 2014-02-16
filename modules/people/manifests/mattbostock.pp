class people::mattbostock {

  include adium
  include alfred
  include chrome
  include gds_development
  include gds_resolver
  include gds_vpn_profiles
  include git
  include gitx
  include gnupg
  include mysql
  include openconnect
  include screen
  include vagrant
  include virtualbox
  include zsh
  include ohmyzsh

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-vbguest': }
  include osx::disable_app_quarantine
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores
  include osx::global::disable_remote_control_ir_receiver
  include osx::dock::dim_hidden_apps
  include osx::dock::autohide

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

  ## You can also include particular projects from modules/projects/manifests
  include projects::deployment
  include projects::deployment::creds

  ## Here's how to include a personal github project
  #repository { "${boxen::config::srcdir}/dotfiles":
  #  source  => 'yourusername/dotfiles',
  #}

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
      'wget',
  ]:
    ensure => present,
  }

  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'godlygeek/tabular': }
}
