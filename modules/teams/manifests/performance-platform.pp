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

  # Performance Platform specific stuff
  include teams::performance-platform::puppet

  repo::gds      { 'google-dev-credentials': }
  repo::gds      { 'pp-manual': }
  repo::gds      { 'pp-pilotis': }
  repo::gds      { 'pp-sync': }
  repo::alphagov { 'backdrop': }
  repo::alphagov { 'backdropsend': }
  repo::alphagov { 'backdrop-asset-request-collector': }
  repo::alphagov { 'backdrop-collector': }
  repo::alphagov { 'backdrop-collector-plugins': }
  repo::alphagov { 'backdrop-google-spreadsheet-collector': }
  repo::alphagov { 'backdrop-transactions-explorer-collector': }
  repo::alphagov { 'cheapseats': }
  repo::alphagov { 'gapy': }
  repo::alphagov { 'performanceplatform-admin': }
  repo::alphagov { 'performanceplatform-client': }
  repo::alphagov { 'performanceplatform-collector': }
  repo::alphagov { 'performanceplatform-collector-config': }

  # You may wish to check out performance-datastore as well. This
  # contains an example of the Write API, and thoughts around the
  # future of the Read API. You should check this out to your GOPATH,
  # so it isn't included here since it shouldn't be checked out to
  # $HOME/govuk

  repo::alphagov { 'performanceplatform-notifier': }
  repo::alphagov { 'pp-development': }
  repo::alphagov { 'pp-smokey': }
  repo::alphagov { 'screenshot-as-a-service': }
  repo::alphagov { 'spotlight': }
  repo::alphagov { 'stagecraft': }
  repo::alphagov { 'stageprompt': }

  # Documentation
  repo::alphagov { 'performanceplatform-documentation': }
  repo::alphagov { 'performance-platform': }

  # Office-y things
  repo::alphagov { 'fourth-wall': }
  repo::alphagov { 'showtime': }
}
