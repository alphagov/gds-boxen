class people::norm {
  # softwares
  include camino
  include chrome
  include dropbox
  include launchbar
  include macvim
  include monocle
  include onepassword
  include textmate
  include things
  include wget
  package {
    [
      'bash-completion',
      'redis',
      'the_silver_searcher',
    ]:
    ensure => present,
  }

  # repos
  include teams::performance-platform

  # preferenceses
  include turn-off-dashboard
}
