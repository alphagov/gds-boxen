# Boxen team definition for the Performance Platform
#
# If you add a repo into here, you might want to consider adding the
# repo to our pull request monitor (currently named pulls.html) in
# https://github.com/alphagov/performance-platform/tree/gh-pages
class teams::performance-platform {
  include projects::development

  # Devops™
  include projects::alphagov-deployment
  include projects::ci-puppet
  include projects::puppet
  include projects::smokey

  # New Devops™ !!!!11!one!!!!
  include teams::performance-platform::puppet

  # Old Word Order
  repo::alphagov { 'limelight': }

  # New World Order
  repo::gds      { 'google-dev-credentials': }
  repo::gds      { 'pp-manual': }
  repo::gds      { 'pp-pilotis': }
  repo::gds      { 'pp-sync': }
  repo::alphagov { 'backdrop': }
  repo::alphagov { 'backdropsend': }
  repo::alphagov { 'backdrop-asset-request-collector': }
  repo::alphagov { 'backdrop-collector': }
  repo::alphagov { 'backdrop-collector-plugins': }
  repo::alphagov { 'backdrop-customer-satisfaction-collector': }
  repo::alphagov { 'backdrop-ga-collector': }
  repo::alphagov { 'backdrop-ga-realtime-collector': }
  repo::alphagov { 'backdrop-ga-trending-collector': }
  repo::alphagov { 'backdrop-pingdom-collector': }
  repo::alphagov { 'backdrop-google-spreadsheet-collector': }
  repo::alphagov { 'backdrop-transactions-explorer-collector': }
  repo::alphagov { 'cheapseats': }
  repo::alphagov { 'gapy': }
  repo::alphagov { 'pp-development': }
  repo::alphagov { 'pp-smokey': }
  repo::alphagov { 'screenshot-as-a-service': }
  repo::alphagov { 'spotlight': }
  repo::alphagov { 'stagecraft': }
  repo::alphagov { 'stageprompt': }
  repo::alphagov { 'transactions-explorer': }

  # Shared GDS repos that we rely on
  repo::alphagov { 'govuk_frontend_toolkit': }
  repo::alphagov { 'govuk_frontend_toolkit_npm': }
  repo::alphagov { 'govuk_template': }
  repo::alphagov { 'govuk_template_mustache': }
  repo::alphagov { 'release': }
  repo::alphagov { 'signonotron2': }
  repo::alphagov { 'slimmer': }
  repo::alphagov { 'static': }
  include projects::styleguides

  # Documentation
  repo::alphagov { 'libretto': }
  repo::alphagov { 'performance-platform': }

  # Office-y things
  repo::alphagov { 'fourth-wall': }
  repo::alphagov { 'showtime': }
}
