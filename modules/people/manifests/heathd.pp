class people::heathd {
  include gds_development

  include adium
  include alfred
  include chrome
  include dash
  include dropbox
  include gitx
  include mysql
  include notational_velocity
  include sublime_text_3
  include sublime_text_3::package_control

  file {"/Users/${::boxen_user}/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap":
    content => '[{ "keys": ["ctrl+command+r"], "command": "reveal_in_side_bar"} ]'
  }

  include slate
  include things
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_ssh_config

  ssh_config::fragment { 'heathd':
    source => 'puppet:///modules/people/heathd/ssh-config',
  }

  include gds_vpn_profiles
  include postgresql

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
  include projects::opsmanual
  include projects::private-utils
  include projects::puppet
  include projects::transition-config
  include projects::rummager
  include projects::signonotron2
  include projects::smokey
  include projects::static
  include projects::vagrant-govuk
  include projects::whitehall

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
      'mongodb',
      'tmux',
      'wget'
    ]:
    ensure => present,
  }
}
