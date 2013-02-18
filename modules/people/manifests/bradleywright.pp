class people::bradleywright {
  include adium
  include alfred
  include chrome
  include dropbox
  include emacs::pretest
  include iterm2::dev
  include mailplane::beta
  include remove-spotlight
  include slate
  include turn-off-dashboard
  include vagrant
  include vagrant-dns
  include virtualbox
  include zsh

  include projects::alphagov-deployment
  include projects::development
  include projects::puppet
  include projects::whitehall

  $home     = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { $projects:
    ensure => directory,
  }

  $dotfiles = "${projects}/dotfiles"

  repository { $dotfiles:
    source  => 'bradleywright/dotfiles',
    require => File[$projects]
  }

  $emacs = "${projects}/emacs-d"

  repository { $emacs:
    source  => 'bradleywright/emacs-d',
    require => File[$projects]
  }

  file { "${home}/.local_zshrc":
    mode    => '0644',
    content => "cdpath=(~/src ~/Projects ~)

alias vup=\"cd ~/src/puppet; git pull; cd ~/src/development; git pull;vagrant destroy; govuk_dev_dist=lucid vagrant up; ssh dev govuk_puppet; vagrant provision; ssh dev 'cd ~/src/dotfiles && make'; ssh dev\"",
  }

  file { "${home}/.localgitconfig":
    mode    => '0644',
    content => '[user]
    email = bradley.wright@digital.cabinet-office.gov.uk
[credential]
    helper = osxkeychain',
  }

  package {
    [
     'bash-completion',
     'parallel',
     'reattach-to-user-namespace',
     'tmux',
     'tree',
     'wget',
     'zsh-completions',
     'zsh-lovers',
     ]:
  }
}
