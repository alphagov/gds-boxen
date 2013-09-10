class people::jennyd {
  include chrome
  include encfs
  include gds-development
  include gnupg
  include iterm2::stable
  include postgresql
  include sublime_text_2
  include turn-off-dashboard
  include wget

  Boxen::Osx_defaults {
    user => $::luser,
  }

  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }

package {
    [
      'python',
      'pwgen',
      'tmux',
    ]:
    ensure => present,
  }

  include osx::dock::autohide
  include osx::disable_app_quarantine
}
