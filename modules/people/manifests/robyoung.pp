class people::robyoung {
  include caffeine
  include chrome
  include dropbox
  include firefox
  include gds-ssh-config
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

  $home = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { $projects:
    ensure => directory,
  }

  # Homebrew packages
  package {
    [
      'bash-completion',
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
