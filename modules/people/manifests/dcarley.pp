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

  $home = "/Users/${::luser}"
  $bash_profile = '[[ -f /opt/boxen/env.sh ]] && . /opt/boxen/env.sh
[[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion
alias b="bundle exec"
'

  file { "${home}/.bash_profile":
    ensure  => present,
    content => $bash_profile,
  }
}
