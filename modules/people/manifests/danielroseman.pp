class people::danielroseman {
  include alfred
  include chrome
  include dropbox
  include gds_development
  include gds_vpn_profiles
  include git
  include hub
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include macvim
  include vagrant
  include gds_virtualbox
  include wget
  include xquartz

  $projects = "${home}/projects"

  $home = "/Users/${::luser}"
  $home_projects = "${home}/Projects"

  file { $home_projects:
    ensure => directory,
  }
  class { 'gds_ssh_config': }

  # Git
  git::config::global { 'color.ui': value => 'true' }
  git::config::global { 'user.name': value => 'Daniel Roseman' }
  git::config::global { 'user.email': value => 'daniel.roseman@digital.cabinet-office.gov.uk' }
  git::config::global { 'core.editor': value => 'vim' }

  repository { "${home}/.vim/bundle/vundle":
    source => 'gmarik/vundle',
  }

  $dotfiles = "${home_projects}/dotfiles"

  repository { "${dotfiles}":
    source => 'danielroseman/dotfiles',
    require => File[$home_projects],
    notify  => Exec['link-dotfiles'],
  }

  exec { 'link-dotfiles':
    command     => "cd ${dotfiles} && sh dotfiles.sh",
    refreshonly => true,
  }

  package {
    [
      'tmux',
      'ctags',
      'python',
      'the_silver_searcher',
    ]:
    ensure => present,
  }

  package { 'go':
    ensure          => present,
    install_options => '--cross-compile-common',
  }

  package {
    ['virtualenv', 'virtualenvwrapper']:
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }
}


