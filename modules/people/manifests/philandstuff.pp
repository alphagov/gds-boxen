class people::philandstuff {
  include caffeine
  include emacs::formacosx
  include iterm2::stable
  include sizeup

  include teams::infrastructure

  package {
    [
      'gnupg',
    ]:
    ensure => present,
  }

  git::config::global {
    'alias.st':     value => "status -bs";
    'color.ui':     value => "true";
    'push.default': value => "simple";
  }

  class { 'gds-ssh-config': extra => '
Host *
  User ppotter
'}

  $home = "/Users/${::luser}"

  file {"${home}/.emacs.d":
    ensure => directory,
  }
  file {"${home}/.emacs.d/init.el":
    ensure => present,
    source => 'puppet:///modules/people/philandstuff/init.el',
  }
}
