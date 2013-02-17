# Pulls the https://github.com/alphagov/puppet repository
class projects::puppet {
  alphagov::repo { 'puppet': }
}
