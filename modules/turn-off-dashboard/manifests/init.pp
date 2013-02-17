# Turns off the OSX Dashboard feature
class turn-off-dashboard {
  boxen::osx_defaults { 'disable-dashboard':
    ensure => present,
    domain => 'com.apple.dashboard',
    key    => 'mcx-disabled',
    value  => 1,
    user   => $user,
    notify => Exec['dashboard-kill-dock'],
  }

  exec { 'dashboard-kill-dock':
    command     => 'killall Dock',
    user        => $user,
    refreshonly => true,
  }
}
