# Pulls the https://github.com/alphagov/puppet repository
class projects::env-sync-and-backup {
  repo::alphagov { 'env-sync-and-backup': }
}
