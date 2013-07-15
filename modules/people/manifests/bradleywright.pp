class people::bradleywright {
  include adium
  include alfred::two
  include chrome
  include dropbox
  include emacs::formacosx
  include gds-resolver
  include flux
  include iterm2::dev
  include mailplane::beta
  include omnifocus
  include qt
  include remove-spotlight
  include slate
  include stay
  include turn-off-dashboard
  include vagrant
  include virtualbox
  include vmware_fusion
  include zeus
  include zsh

  $vagrant_ip = '10.1.2.190'

  class { 'gds-ssh-config': extra => template('people/bradleywright/ssh_config')}

  include projects::alphagov-deployment
  include projects::development
  include projects::fabric-scripts
  include projects::frontend
  include projects::govuk_frontend_toolkit
  include projects::private-utils
  include projects::puppet
  include projects::redirector
  include projects::rummager
  include projects::smokey
  include projects::static
  include projects::whitehall

  vagrant::plugin { 'vagrant-vmware-fusion': }
  vagrant::plugin { 'vagrant-dns': }

  $home     = "/Users/${::luser}"
  $home_projects = "${home}/Projects"

  file { $home_projects:
    ensure => directory,
  }

  # Emacs overrides for Rails projects
  file { "${boxen::config::srcdir}/.dir-locals.el":
    source  => 'puppet:///modules/people/bradleywright/govuk-dir-locals.el',
    require => File["${boxen::config::srcdir}"],
  }

  $dotfiles = "${home_projects}/dotfiles"

  repository { $dotfiles:
    source  => 'bradleywright/dotfiles',
    require => File[$home_projects],
    notify  => Exec['bradleywright-make-dotfiles'],
  }

  exec { 'bradleywright-make-dotfiles':
    command     => "cd ${dotfiles} && make",
    refreshonly => true,
  }

  $emacs = "${home_projects}/emacs-d"

  repository { $emacs:
    source  => 'bradleywright/emacs-d',
    require => File[$home_projects],
    notify  => Exec['bradleywright-make-emacs-d'],
  }

  exec { 'bradleywright-make-emacs-d':
    command     => "cd ${emacs} && make",
    refreshonly => true,
  }

  file { "${home}/.emacs.d/local/${::hostname}.el":
    mode    => '0644',
    source  => 'puppet:///modules/people/bradleywright/emacs-host-local.el',
    require => Repository[$emacs],
  }

  file { "${home}/.local_zshenv":
    mode   => '0644',
    source => 'puppet:///modules/people/bradleywright/local_zshenv',
  }

  file { "${home}/.local_zshrc":
    mode   => '0644',
    source => 'puppet:///modules/people/bradleywright/local_zshrc',
  }

  git::config::global { 'user.email':
    value => 'bradley.wright@digital.cabinet-office.gov.uk'
  }

  git::config::global { 'include.path':
    value => "${home}/.local_gitconfig",
  }

  file {"${boxen::config::srcdir}/development/Vagrantfile.local":
    content => template('people/bradleywright/Vagrantfile.local'),
    require => Class['Projects::Development']
  }

  package {
    [
     'bash-completion',
     'ghostscript',
     'go',
     'imagemagick',
     'mysql',
     'parallel',
     'python',
     'reattach-to-user-namespace',
     'tmux',
     'tree',
     'wget',
     'xpdf',
     'zsh-completions',
     'zsh-lovers',
     ]:
  }

  file { '/usr/local/bin/pdfinfo':
    ensure  => link,
    target  => '/opt/boxen/homebrew/bin/pdfinfo',
    require => Package['xpdf'],
    owner   => root,
  }
  # set up Sass source maps correctly
  file { '/var/govuk':
    ensure => link,
    target => "${boxen::config::srcdir}"
  }

}
