# Pulls the https://github.com/alphagov/EFG repository
# Puppet class names should be lower-case, hence the incongruence with the repo name
class projects::efg {
  repo::alphagov { 'EFG': }
}
