class people::dcarley {
  include adium
  include caffeine
  include chrome
  include git
  include iterm2::stable
  include virtualbox
  include wget

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment

  # These are all Homebrew packages
  package {
    [
      'bash-completion', 'gnupg', 'go', 'tmux'
    ]:
    ensure => present,
  }

  exec { 'restart_dock':
    command     => 'killall -1 Dock',
    refreshonly => true,
  }

  boxen::osx_defaults { 'dock size':
    domain  => 'com.apple.dock',
    key     => 'tilesize',
    value   => 50,
    type    => 'int',
    user    => $::luser,
    notify  => Exec['restart_dock'],
  }

  $home = "/Users/${::luser}"
  $projects = "${home}/projects"
  $projects_personal = "${projects}/personal"

  file { [$projects, $projects_personal]:
    ensure  => directory,
  }

  $dotfiles = "${projects_personal}/dotfiles"

  repository { $dotfiles:
    source  => 'dcarley/dotfiles',
    require => File[$projects_personal],
  }

  exec { 'install dotfiles':
    command     => 'rake',
    cwd         => $dotfiles,
    logoutput   => true,
  }

  file { "${home}/.bash_profile":
    ensure  => present,
    content => '[[ -f /opt/boxen/env.sh ]] && . /opt/boxen/env.sh
[[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion
alias b="bundle exec"
'
  }
}
