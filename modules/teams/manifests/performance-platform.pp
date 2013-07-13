# Boxen team definition for the Performance Platform
#
# If you add a repo into here, you might want to consider adding the
# repo to our pull request monitor (currently named pulls.html) in
# https://github.com/alphagov/performance-platform/tree/gh-pages
class teams::performance-platform {
  include projects::development

  # Devops™
  include projects::alphagov-deployment
  include projects::puppet

  # New Devops™ !!!!11!one!!!!
  include teams::performance-platform::puppet

  # Old World Order
  repo::gds      { 'datainsight': }
  repo::gds      { 'datainsight-akamai-scanner': }
  repo::alphagov { 'datainsight-everything-recorder': }
  repo::alphagov { 'datainsight-format-success-recorder': }
  repo::alphagov { 'datainsight-frontend': }
  repo::alphagov { 'datainsight-ga-collector': }
  repo::alphagov { 'datainsight-ga-functional-test': }
  repo::alphagov { 'datainsight-govuk-collector': }
  repo::alphagov { 'datainsight-insidegov-collector': }
  repo::alphagov { 'datainsight-insidegov-recorder': }
  repo::alphagov { 'datainsight-narrative-recorder': }
  repo::alphagov { 'datainsight-nongovuk-reach-collector': }
  repo::gds      { 'datainsight-release-info': }
  repo::alphagov { 'datainsight-todays-activity-recorder': }
  repo::alphagov { 'datainsight-weekly-reach-recorder': }
  repo::alphagov { 'datainsight_collector': }
  repo::alphagov { 'datainsight_logging': }
  repo::alphagov { 'datainsight_recorder': }

  # New World Order
  repo::gds      { 'google-dev-credentials': }
  repo::alphagov { 'backdrop': }
  repo::alphagov { 'backdrop-send': }
  repo::alphagov { 'backdrop-ga-collector': }
  repo::alphagov { 'backdrop-ga-realtime-collector': }
  repo::alphagov { 'backdrop-pingdom-collector': }
  repo::alphagov { 'limelight': }
  repo::alphagov { 'pp-development': }
  repo::alphagov { 'stageprompt': }

  # Documentation
  repo::alphagov { 'performance-platform': }
  repo::alphagov { 'libretto': }
}
