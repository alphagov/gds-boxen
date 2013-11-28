class teams::mainstream {
  include projects::development

  # Devops™
  include projects::alphagov-deployment
  include projects::puppet

  # Frontend apps
  include projects::business-support-finder
  include projects::calculators
  include projects::calendars
  include projects::frontend
  include projects::govuk_content_api
  include projects::licence-finder
  include projects::smart-answers
  include projects::support
  include projects::static

  # Backend apps
  include projects::feedback
  include projects::imminence
  include projects::need-o-tron
  include projects::panopticon
  include projects::publisher
  include projects::rummager
  include projects::signonotron2
  include projects::travel-advice-publisher

  # Gems
  include projects::gds-api-adapters
  include projects::gds-sso
  include projects::govspeak
  include projects::govuk_content_models
  include projects::plek
  include projects::slimmer
}
