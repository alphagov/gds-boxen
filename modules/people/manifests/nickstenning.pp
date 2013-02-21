class people::nickstenning {
  include adium
  include alfred
  include chrome
  include dropbox
  include dnsmasq
  include iterm2::dev
  include macvim
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

  package {
    [
      'autoenv',
      'coreutils',
      'ctags',
      'curl-ca-bundle',
      'daemontools',
      'dash',
      'elasticsearch',
      'encfs',
      'fuse4x',
      'fuse4x-kext',
      'git',
      'gnupg2',
      'go',
      'gpg-agent',
      'graphviz',
      'heroku-toolbelt',
      'htop-osx',
      'keychain',
      'mobile-shell',
      'mtr',
      'multimarkdown',
      'nginx',
      'parallel',
      'pstree',
      'pv',
      'pwgen',
      'pypy',
      'python',
      'python3',
      'reattach-to-user-namespace',
      'redis',
      'redo',
      's3cmd',
      'ssh-copy-id',
      'tmux',
      'tree',
      'watch',
      'wget',
      'xz',
      'z'
    ]:
    ensure => present,
  }
}
