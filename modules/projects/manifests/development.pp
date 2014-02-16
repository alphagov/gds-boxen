# Pulls the https://github.com/alphagov/development repository
class projects::development {
  include gds_virtualbox
  repo::gds { 'development': }
}
