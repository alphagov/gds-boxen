class teams::trade-tariff {
  include projects::development

  # Devops™
  include projects::alphagov-deployment
  include projects::puppet

  repo::alphagov { 'trade-tariff-admin': }
  include projects::trade-tariff-frontend
  include projects::trade-tariff-backend
  include projects::trade-tariff-suite

  # we write tests, m'kay?
  include projects::smokey
}
