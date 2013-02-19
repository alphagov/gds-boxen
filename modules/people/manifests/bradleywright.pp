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
  include projects::frontend
  include projects::private-utils
  include projects::puppet
  include projects::redirector
  include projects::rummager
  include projects::static
  include projects::whitehall

  $home     = "/Users/${::luser}"
  $home_projects = "${home}/Projects"

  file { $home_projects:
    ensure => directory,
  }

  # Emacs overrides for Rails projects
  file { "${boxen::config::srcdir}/.dir-locals.el":
    content => "((js2-mode . ((js2-basic-offset . 2)))
 (scss-mode . ((css-indent-offset . 2))))",
    require => File["${boxen::config::srcdir}"],
  }

  $dotfiles = "${home_projects}/dotfiles"

  repository { $dotfiles:
    source  => 'bradleywright/dotfiles',
    require => File[$home_projects]
  }

  $emacs = "${home_projects}/emacs-d"

  repository { $emacs:
    source  => 'bradleywright/emacs-d',
    require => File[$home_projects]
  }

  file { "${home}/.local_zshrc":
    mode    => '0644',
    content => "cdpath=(~/src ~/Projects ~)

export govuk_dev_dist='lucid'

alias vup=\"cd ~/src/puppet; git pull; cd ~/src/development; git pull;vagrant destroy; govuk_dev_dist=lucid vagrant up; ssh dev 'sudo apt-get -y install libxml2-dev libxslt-dev && govuk_puppet'; vagrant provision; ssh dev 'cd ~/src/dotfiles && make'; ssh dev\"",
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
