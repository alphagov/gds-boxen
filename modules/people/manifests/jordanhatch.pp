class people::jordanhatch {
  include adium
  include alfred
  include chrome
  include iterm2::stable
  include spotify
  include theunarchiver
  include virtualbox

  include projects::development

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

