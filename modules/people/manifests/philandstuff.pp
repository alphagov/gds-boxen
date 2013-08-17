class people::philandstuff {
  include caffeine
  include emacs::formacosx
  include emacs-keybindings
  include iterm2::stable
  include openconnect
  include sizeup
  include vagrant

  include projects::deployment
  include projects::deployment::creds

  include teams::infrastructure

  package {
    [
      'bash-completion',
      'fakeroot',
      'leiningen',
      'markdown',
      'python',
      'tmux',
    ]:
    ensure => present,
  }

  package {
    ['virtualenv','virtualenvwrapper']:
    ensure => present,
    provider => pip,
  }

  git::config::global {
    'alias.st':     value => "status -bs";
    'color.ui':     value => "true";
    'push.default': value => "simple";
  }

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-dns': }

  class { 'gds-ssh-config': }
  ssh_config::fragment {'user':
    content => '
Host *
  User ppotter
'}

  $home = "/Users/${::luser}"

  file {"${home}/.bashrc":
    content => '[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

[[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/govuk
source /opt/boxen/homebrew/bin/virtualenvwrapper.sh
',
  }

  repository { "${home}/.emacs.d":
    source => 'git@github.com:philandstuff/dot-emacs.git',
  }
}
