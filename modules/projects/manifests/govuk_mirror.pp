# Pulls the https://github.com/alphagov/govuk_mirror-puppet repository
class projects::govuk_mirror {
  repo::alphagov { 'govuk_mirror-puppet': }
}
