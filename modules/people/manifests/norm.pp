class people::norm {
  # softwares
  include adium
  include antirsi
  include camino
  include chrome
  include dropbox
  include firefox
  include gitx::dev
  include launchbar
  include macvim
  include monocle
  include notational_velocity::nvalt
  include onepassword
  include screen
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
