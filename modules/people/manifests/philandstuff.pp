class people::philandstuff {
  include caffeine
  include emacs::formacosx

  include teams::infrastructure

  package {
    [
      'gnupg',
    ]:
    ensure => present,
  }

  git::config::global {
    'push.default': value => "simple";
  }

  $home = "/Users/${::luser}"

  file {"${home}/.emacs.d":
    ensure => directory,
  }
  file {"${home}/.emacs.d/init.el":
    ensure => present,
    source => 'puppet:///modules/people/philandstuff/init.el',
  }
}
