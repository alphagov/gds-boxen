class people::philandstuff {
  include emacs::formacosx

  include teams::infrastructure

  package {
    [
      'gnupg',
    ]:
    ensure => present,
  }
}
