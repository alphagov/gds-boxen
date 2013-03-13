# Pulls the https://github.com/alphagov/vagrant-govuk repository
class projects::vagrant-govuk {
  include projects::vcloud-templates
  include projects::puppet

  repo::alphagov { 'vagrant-govuk': }
}
