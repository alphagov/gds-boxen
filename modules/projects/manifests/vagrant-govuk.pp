# Pulls the https://github.com/alphagov/vagrant-govuk repository
class projects::vagrant-govuk {
  include projects::govuk-provisioning
  include projects::puppet

  repo::alphagov { 'vagrant-govuk': }
}
