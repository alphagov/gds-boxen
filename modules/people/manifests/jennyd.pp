class people::jennyd {
  include chrome
  include dropbox
  include encfs
  include gds_development
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_ssh_config
  include gds_vpn_profiles
  include gnupg
  include iterm2::stable
  include skype
  include sublime_text_2
  include wget

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-zz-multiprovider-snap': }

  include projects::alphagov-deployment
  include projects::ci-deployment
  include projects::ci-puppet
  include projects::deployment::creds
  include projects::development
  include projects::fabric-scripts
  include projects::frontend
  include projects::gds-api-adapters
  include projects::gds-sso
  include projects::govuk_content_api
  include projects::govuk_mirror
  include projects::imminence
  include projects::opsmanual
  include projects::private-utils
  include projects::puppet
  include projects::redirector
  include projects::release
  include projects::rummager
  include projects::signonotron2
  include projects::smokey
  include projects::static
  include projects::vagrant-govuk
  include projects::whitehall

  Boxen::Osx_defaults {
    user => $::luser,
  }

  include osx::disable_app_quarantine
  include osx::dock::autohide
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
  include osx::global::disable_autocorrect
  include osx::global::enable_keyboard_control_access
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate
  include osx::no_network_dsstores

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  class { 'osx::dock::position':
    position => 'left'
  }

  package {
    [
      'python',
      'tmux',
    ]:
    ensure => present,
  }

  package {
    [
      'virtualenv',
      'virtualenvwrapper'
    ]:
    ensure => present,
    provider => pip,
  }

  ssh_config::fragment { 'jennyd':
    source => 'puppet:///modules/people/jennyd/ssh-config',
  }

  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'jennyd/dotfiles',
    notify  => Exec['join-the-dots'],
  }

  exec { 'join-the-dots':
    cwd         => $dotfiles,
    command     => "bash join-the-dots.sh",
    logoutput   => true,
  }

}
