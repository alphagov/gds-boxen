class people::jordanhatch {
  include adium
  include alfred
  include chrome
  include gitx
  include iterm2::stable
  include spotify
  include unarchiver
  include virtualbox

  include teams::mainstream

  $home = "/Users/${::luser}"
  $dev = "${home}/dev"

  file { $dev:
    ensure => directory,
  }

  $dotfiles = "${dev}/dotfiles"

  repository { $dotfiles:
    source  => 'JordanHatch/dotfiles',
    require => File[$dev],
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

