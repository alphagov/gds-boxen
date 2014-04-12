class people::samjsharpe::defaults {

  Boxen::Osx_defaults {
    user => $::luser,
  }

  # Settings from gds_osx
  include gds_osx::remove_spotlight
  include gds_osx::turn_off_dashboard
  # Settings from puppet-osx
  include osx::disable_app_quarantine
  include osx::dock::2d
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores
  osx::recovery_message { 'If found please call 07712 046007': }

  boxen::osx_defaults { 'Put my Dock on the left':
    key    => 'orientation',
    domain => 'com.apple.dock',
    value  => 'left',
  }

  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }
}
