class people::dcarley {
  include caffeine
  include chrome
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_vpn_profiles
  include git
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include java
  include vim
  include gds_virtualbox
  include wget

  include zsh
  include ohmyzsh

  class { 'gds_printers':
    ldap_username => 'dancarley',
  }

  class { 'vagrant':
    version => '1.8.1',
  }
  vagrant::plugin { 'vagrant-vmware-fusion': }
  vagrant::plugin { 'cachier': }
  vagrant::plugin { 'multiprovider-snap': }

  include osx::global::tap_to_click
  include osx::keyboard::capslock_to_control
  include osx::dock::clear_dock
  class { 'osx::dock::icon_size': size => 40 }
  boxen::osx_defaults { 'enable trackpad three-finger drag':
    ensure => present,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'TrackpadThreeFingerDrag',
    value  => '1',
    user   => $::boxen_user,
  }
  boxen::osx_defaults { 'show battery percentage remaining':
    ensure => present,
    domain => 'com.apple.menuextra.battery',
    key    => 'ShowPercent',
    type   => 'string',
    value  => 'YES',
    user   => $::boxen_user,
  }

  # Projects accessible to everyone in Infrastructure
  class { 'teams::infrastructure': manage_gitconfig => false }
  include gds_ssh_config
  include projects::router

  # Projects only accessible to certain staff
  include projects::deployment
  include projects::deployment::creds

  # These are all Homebrew packages
  package {
    [
      'apg',
      'docker',
      'docker-machine',
      'entr',
      'gnu-sed',
      'terraform',
      'tig',
      'tmux',
      'watch',
    ]:
    ensure => present,
  }

  homebrew::tap { 'tsuru/tsuru': } ->
  package { [
    'tsuru',
    'tsuru-admin',
    'crane',
  ]:
    ensure => present,
  }

  package { 'python':
    ensure => present,
  } ->
  package { [
    'virtualenv',
    'virtualenvwrapper',
  ]:
    ensure   => present,
    provider => 'pip',
  }

  package { 'go':
    ensure          => present,
    install_options => '--cross-compile-common',
  }

  $home              = "/Users/${::luser}"
  $projects          = "${home}/projects"
  $projects_personal = "${projects}/personal"
  $dotfiles          = "/Users/${::luser}/dotfiles"

  file { [$projects, $projects_personal]:
    ensure  => directory,
  }

  repository { $dotfiles:
    source  => 'dcarley/dotfiles',
    notify  => Exec['install dotfiles'],
  }

  exec { 'install dotfiles':
    command     => 'rake',
    cwd         => $dotfiles,
    logoutput   => true,
    refreshonly => true,
  }

  # Dependency for puppet-vim
  file { "${home}/.vimrc":
    ensure  => link,
    target  => "dotfiles/.vimrc",
    require => Exec['install dotfiles'],
  }

  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'godlygeek/tabular': }
  vim::bundle { 'gabrielelana/vim-markdown': }
  vim::bundle { 'fatih/vim-go': }
}
