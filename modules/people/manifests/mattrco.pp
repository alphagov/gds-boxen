class people::mattrco {
  $home_directory = '/Users/mattcottingham'

  # Mac apps
  include chrome
  include firefox
  include iterm2::stable
  include macvim
  include spotify
  include onepassword
  include xquartz
  include wireshark

  # Dev VM
  include vagrant
  include gds_virtualbox::42_latest
  vagrant::plugin { 'vagrant-dns': }
  include projects::puppet

  # Performance Platform repos
  include teams::performance-platform

  # Git
  git::config::global { 'color.ui': value => 'true' }
  git::config::global { 'user.name': value => 'Matt Cottingham' }
  git::config::global { 'user.email': value => 'matt.cottingham@digital.cabinet-office.gov.uk' }
  git::config::global { 'core.editor': value => 'vim' }

  # Vim config
  file { "${home_directory}/.vimrc":
    source => 'puppet:///modules/people/mattrco/vimrc',
  }

  class { 'gds_ssh_config': }
  ssh_config::fragment { 'performance-platform':
    content => template('teams/performance-platform/ssh-config'),
  }

  # Homebrew packages
  package {
    [
      'bash-completion',
      'colordiff',
      'ctags-exuberant',
      'meld',
      'mercurial',
      'nmap',
      'python',
      'tree',
      'wget',
    ]:
    ensure => present,
  }

  package { 'go':
    ensure          => present,
    install_options => '--cross-compile-common',
  }

  package {'virtualenv':
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }

  package {'virtualenvwrapper':
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }

}
