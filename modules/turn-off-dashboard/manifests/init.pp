# Turns off the OSX Dashboard feature
class turn-off-dashboard {
  exec { 'disable-dashboard':
    command => 'defaults write com.apple.dashboard mcx-disabled -boolean YES',
    unless  => '/usr/bin/defaults read com.apple.dashboard mcx-disabled | grep -Fqe 1',
    notify  => Exec['dashboard-kill-dock'],
  }
  exec { 'dashboard-kill-dock':
    command     => 'killall Dock',
    user        => $user,
    refreshonly => true,
  }
}
