class people::norm {
  include chrome
  include dropbox
  include launchbar
  include macvim
  include monocle
  include onepassword
  include textmate
  include things
  include wget

  include teams::performance-platform

  package {
    [
      'bash-completion',
      'redis',
    ]:
    ensure => present,
  }
}
