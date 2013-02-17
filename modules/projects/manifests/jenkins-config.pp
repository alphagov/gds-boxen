# Pulls the https://github.com/alphagov/puppet repository
class projects::jenkins-config {
  alphagov::repo { 'jenkins-config': }
}
