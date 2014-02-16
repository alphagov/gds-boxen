# Turns off the OSX Dashboard feature
class gds_osx::turn_off_dashboard {
  include osx::dock

  boxen::osx_defaults { 'Disables Dashboard':
    user   => $::boxen_user,
    domain => 'com.apple.dashboard',
    key    => 'mcx-disabled',
    value  => true,
    notify => Exec['killall Dock'];
  }
}
