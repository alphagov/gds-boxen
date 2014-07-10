class teams::transition {
  # Apps
  include projects::bouncer
  include projects::redirector
  include projects::side-by-side-browser
  include projects::transition

  # Data
  include projects::transition-stats
  include projects::pre-transition-stats

  # Gems
  include projects::govuk_admin_template
  include projects::optic14n
}
