# Pulls the https://github.com/alphagov/puppet repository
class projects::env-sync-and-backup {
  alphagov::repo { 'env-sync-and-backup': }
}
