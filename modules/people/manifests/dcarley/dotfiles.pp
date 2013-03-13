class people::dcarley::dotfiles {
  $dotfiles = "/Users/${::luser}/dotfiles"

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

  file { "${home}/.bash_profile":
    ensure  => present,
    content => '[[ -f /opt/boxen/env.sh ]] && . /opt/boxen/env.sh
[[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion
alias b="bundle exec"
'
  }
}
