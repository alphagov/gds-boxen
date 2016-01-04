# Boxen team definition for the Performance Platform
#
# If you add a repo into here, you might want to consider adding the
# repo to our pull request monitor (currently named pulls.html) in
# https://github.com/alphagov/performance-platform/tree/gh-pages
class teams::performance-platform {

  # GOV.UK development environment and smoke tests
  include projects::development
  include projects::puppet
  include projects::smokey

  # GOV.UK: Transactions Explorer
  include projects::alphagov-deployment
  repo::alphagov { 'transactions-explorer': }

  # Shared GDS repos that we rely on
  include projects::ci-puppet
  include projects::styleguides
  repo::alphagov { 'govuk_frontend_toolkit': }
  repo::alphagov { 'govuk_frontend_toolkit_npm': }
  repo::alphagov { 'govuk_template': }
  repo::alphagov { 'govuk_template_mustache': }
  repo::alphagov { 'release': }
  repo::alphagov { 'signonotron2': }

  repo::gds      { 'google-dev-credentials': }
  repo::gds      { 'pp-manual': }
  repo::gds      { 'pp-pilotis': }
  repo::gds      { 'pp-sync': }
  repo::alphagov { 'backdrop': }
  repo::alphagov { 'cheapseats': }
  repo::alphagov { 'gapy': }
  repo::alphagov { 'performance-datastore': }
  repo::alphagov { 'performanceplatform-admin': }
  repo::alphagov { 'performanceplatform-big-screen-view': }
  repo::alphagov { 'performanceplatform-client.js': }
  repo::alphagov { 'performanceplatform-client.py': }
  repo::alphagov { 'performanceplatform-collector': }
  repo::alphagov { 'performanceplatform-collector-config': }
  repo::alphagov { 'performanceplatform-notifier': }
  repo::alphagov { 'performanceplatform-organisation-api': }
  repo::alphagov { 'pp-smokey': }
  repo::alphagov { 'pp-deploy-lag-radiator': }
  repo::alphagov { 'screenshot-as-a-service': }
  repo::alphagov { 'spotlight': }
  repo::alphagov { 'stagecraft': }
  repo::alphagov { 'stageprompt': }

  # Documentation
  repo::alphagov { 'performanceplatform-documentation': }

  # Office-y things
  repo::alphagov { 'fourth-wall': }
  repo::alphagov { 'showtime': }
}
