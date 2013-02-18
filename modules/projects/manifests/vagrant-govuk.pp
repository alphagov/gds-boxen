# Pulls the https://github.com/alphagov/vagrant-govuk repository
include projects::vcloud-templates
include projects::puppet
include projects::deployment
class projects::vagrant-govuk {
  repo::alphagov { 'vagrant-govuk': }
}
