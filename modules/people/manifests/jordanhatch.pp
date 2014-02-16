class people::jordanhatch {
  include adium
  include alfred::v1
  include chrome
  include dropbox
  include gitx
  include iterm2::stable
  include spotify
  include unarchiver
  include gds_virtualbox
  vagrant::plugin { 'vagrant-dns': }
  include projects::puppet

  include teams::mainstream

  $home = "/Users/${::luser}"
  $src = "${home}/src"

  file { $src:
    ensure => directory,
  }
  file { "${home}/dev":
    ensure => link,
    target => "${home}/Dropbox/dev",
  }

  $dotfiles = "${src}/dotfiles"

  repository { $dotfiles:
    source  => 'JordanHatch/dotfiles',
    require => File[$src],
    notify  => Exec['install-dotfiles'],
  }

  exec { "install-dotfiles":
    cwd         => $dotfiles,
    command     => "make",
    refreshonly => true
  }

  package { [
   'gdbm',
   'pkg-config',
   'python',
   'readline',
   'sqlite',
   ]:
   ensure => 'present',
  }
}
