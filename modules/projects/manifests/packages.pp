# Pulls the https://github.com/alphagov/packages repository
class projects::packages {
  alphagov::repo { 'packages': }
}
