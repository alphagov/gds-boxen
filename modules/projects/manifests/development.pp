# Pulls the https://github.com/alphagov/development repository
class projects::development {
  include virtualbox
  repo::alphagov { 'development': }
}
