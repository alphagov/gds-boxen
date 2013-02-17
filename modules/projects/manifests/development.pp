# Pulls the https://github.com/alphagov/puppet repository
class projects::development {
  alphagov::repo { 'development': }
}
