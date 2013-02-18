# Pulls the https://github.com/alphagov/puppet repository
class projects::development {
  include virtualbox
  repo::alphagov { 'development': }
}
