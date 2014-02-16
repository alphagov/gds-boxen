class people::norm {
  # softwares
  include adium
  include antirsi
  include camino
  include chrome
  include dropbox
  include firefox
  include gds_osx::turn_off_dashboard
  include gitx::dev
  include istatmenus4
  include launchbar
  include macvim
  include monocle
  include notational_velocity::nvalt
  include onepassword
  include screen
  include textmate
  include things
  include wget
  include xquartz
  package {
    [
      'bash-completion',
      'py2cairo',
      'redis',
      'the_silver_searcher',
    ]:
    ensure => present,
  }

  # repos
  include teams::mainstream
  repo::alphagov { 'government-service-design-manual': }

  # preferenceses
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::disable_app_quarantine
}
