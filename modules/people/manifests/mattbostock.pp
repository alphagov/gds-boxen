class people::mattbostock {

  include chrome
  include gds_development
  include gds_resolver
  include gds_vpn_profiles
  include gds_osx::turn_off_dashboard
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
  include osx::dock::clear_dock
  include osx::dock::dim_hidden_apps
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click
  include osx::keyboard::capslock_to_control
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

  class { 'gds_printers':
    ldap_username => 'mattbostock',
  }

  repository { "/Users/${::boxen_user}/.dotfiles":
    source  => "${::github_login}/dotfiles",
  } ->
  exec { 'create dotfiles symlinks':
    command => 'rcup',
    cwd     => "/Users/${::boxen_user}",
    environment => ["USER=${::boxen_user}"],
  } -> Package <| |>

  ## This is how to install Homebrew packages
  ## You can get a list of your current packages with
  ## `brew list`
  package {
    [
      'autoconf',
      'autojump',
      'automake',
      'bash-completion',
      'bazaar',
      'boot2docker',
      'brew-cask',
      'chromedriver',
      'cmake',
      'composer',
      'coreutils',
      'ctags',
      'docker',
      'encfs',
      'entr',
      'gnupg',
      'go',
      'gradle',
      'htop-osx',
      'ipcalc',
      'jq',
      'libxml2',
      'mercurial',
      'packer',
      'pandoc',
      'phantomjs',
      'php54',
      'pinentry',
      'rcm',
      'selenium-server-standalone',
      'sqlite',
      'tig',
      'wdiff',
      'wget',
      'xz',
    ]:
    ensure => present,
  } ->
  homebrew::tap { 'thoughtbot/formulae': }


  package {
    [
      'dropbox',
      'firefox',
      'google-chrome',
      'gpgtools',
      'mou',
      'osxfuse',
      'sequel-pro',
    ]:
    ensure   => present,
    provider => 'brewcask',
  }
}
