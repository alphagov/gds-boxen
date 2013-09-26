class people::jennyd {
  include chrome
  include dropbox
  include encfs
  include gds-development
  include gnupg
  include iterm2::stable
  include skype
  include sublime_text_2
  include turn-off-dashboard
  include wget

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-zz-multiprovider-snap': }

  include projects::development
  include projects::fabric-scripts
  include projects::opsmanual
  include projects::puppet
  include projects::redirector
  include projects::vagrant-govuk

  Boxen::Osx_defaults {
    user => $::luser,
  }

  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }

  include osx::dock::autohide
  include osx::disable_app_quarantine

  class { 'osx::global::key_repeat_delay':
    delay => 200
  }

  class { 'osx::global::key_repeat_rate':
    rate => 400
  }

  package {
    [
      'python',
      'pwgen',
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

  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/dotfiles"

  repository { $dotfiles:
    source  => 'jennyd/dotfiles',
    notify  => Exec['join-the-dots'],
  }

  exec { 'join-the-dots':
    cwd         => $dotfiles,
    command     => "./join-the-dots.sh",
    refreshonly => true,
  }

}
