# Pulls the https://github.com/alphagov/vagrant-govuk repository
class projects::vagrant-govuk {
  alphagov::repo { 'vagrant-govuk': }
}
