class people::robyoung {
  include caffeine
  include chrome
  include dropbox
  include firefox
  include gds-resolver
  include git
  include iterm2::stable
  include ohmyzsh
  include openconnect
  include propane
  include pycharm
  include rubymine
  include sublime_text_2
  include virtualbox::latest
  include zsh

  include teams::performance-platform
  include projects::deployment
  include projects::vcloud-templates


  class { 'gds-ssh-config': }
  ssh_config::fragment{'performance-platform':
    content => template('teams/performance-platform/ssh-config'),
  }

  $home = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { $projects:
    ensure => directory,
  }

  # Homebrew packages
  package {
    [
      'bash-completion',
      'bazaar',
      'htop-osx',
      'go',
      'mercurial',
      'mongodb',
      'mysql',
      'python',
      'redis',
      'zeromq',
      'zsh-completions',
      'zsh-lovers',
      'wget',
    ]:
    ensure => present,
  }

  # Python packages
  package {
    [
      'virtualenv',
      'virtualenvwrapper',
    ]:
    ensure => present,
    provider => pip,
  }
}
