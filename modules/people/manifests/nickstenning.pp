class people::nickstenning {
  include adium
  include alfred
  include chrome
  include dropbox
  include dnsmasq
  include gnupg
  include iterm2::dev
  include mailplane::beta
  include nvm
  include onepassword
  include turn-off-dashboard
  include theunarchiver
  include vagrant
  include vagrant-dns
  include virtualbox
  include zsh

  include teams::infrastructure

  include projects::deployment
  include projects::deployment::creds

  $home = "/Users/${::luser}"
  $code = "${home}/code"

  file { $code:
    ensure => directory,
  }

  $dotfiles = "${code}/dotfiles"

  repository { $dotfiles:
    source  => 'nickstenning/dotfiles',
    require => File[$code],
    notify  => Exec['install-dotfiles'],
  }

  exec { 'install-dotfiles':
    cwd         => $dotfiles,
    command     => 'redo',
    refreshonly => true,
    require     => Package['redo'],
  }

  file { "${home}/.localgitconfig":
    mode    => '0644',
    content => '[user]
    email = nick.stenning@digital.cabinet-office.gov.uk
    signingkey = nick.stenning@digital.cabinet-office.gov.uk
[core]
    excludesfile = /opt/boxen/config/git/gitignore
[hub]
    host = github.gds'
  }

  repository { "${code}/vim":
    source  => 'nickstenning/dotvim',
    require => File[$code],
    notify  => Exec['install-dotvim'],
  }

  exec { 'install-dotvim':
    cwd         => "${code}/vim",
    command     => 'sh install',
    refreshonly => true,
  }

  repository { "${home}/.virtualenvs":
    source  => 'nickstenning/dotvirtualenvs',
  }

  package {
    [
      'autoenv',
      'coreutils',
      'ctags',
      'curl-ca-bundle',
      'daemontools',
      'dash',
      'elasticsearch',
      'git',
      'go',
      'gpg-agent',
      'graphviz',
      'heroku-toolbelt',
      'htop-osx',
      'keychain',
      'mercurial',
      'mobile-shell',
      'mtr',
      'multimarkdown',
      'nginx',
      'parallel',
      'pstree',
      'pv',
      'pwgen',
      'python',
      'python3',
      'reattach-to-user-namespace',
      'redis',
      'redo',
      'rlwrap',
      's3cmd',
      'ssh-copy-id',
      'tmux',
      'tree',
      'watch',
      'wget',
      'vim',
      'xz',
      'z'
    ]:
    ensure => present,
  }
}
