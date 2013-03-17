class teams::performance-platform {
  include projects::development

  # Devops™
  include projects::alphagov-deployment
  include projects::puppet

  repo::gds      { 'backdrop': }
  repo::alphagov { 'datainsight': }
  repo::alphagov { 'datainsight-akamai-scanner': }
  repo::alphagov { 'datainsight-collectors': }
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
  repo::alphagov { 'datainsight-release-info': }
  repo::alphagov { 'datainsight-todays-activity-recorder': }
  repo::alphagov { 'datainsight-weekly-reach-recorder': }
  repo::alphagov { 'datainsight_collector': }
  repo::alphagov { 'datainsight_logging': }
  repo::alphagov { 'datainsight_recorder': }
  repo::alphagov { 'limelight': }
}
