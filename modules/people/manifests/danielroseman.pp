class people::danielroseman {
  include alfred
  include chrome
  include dropbox
  include gds_development
  include gds_vpn_profiles
  include git
  include hub
  include iterm2::stable
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
    ]:
    ensure => present,
  }

  include python::2_7_6
  python::package { 'virtualenv for python 2.7.6': package => 'virtualenv', python_version => '2.7.6' }

}


