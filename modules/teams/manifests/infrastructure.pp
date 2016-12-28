class teams::infrastructure ($manage_gitconfig = false) {
  include projects::alphagov-deployment
  include projects::ci-puppet
  include projects::development
  include projects::env-sync-and-backup
  include projects::fabric-scripts
  include projects::ghtools
  include projects::govuk_mirror
  include projects::govuk_offsitebackups-puppet
  include projects::govuk-provisioning
  include projects::opsmanual
  include projects::packager
  include projects::smokey

  $alphagov_repos = [
    'nagios-plugins',
    'cdn-acceptance-tests',
    'govuk-puppet',
    'govuk-app-deployment',
    'govuk-terraform-provisioning',
  ]

  repo::alphagov { $alphagov_repos: }

  if $manage_gitconfig {
    git::config::global {
      'alias.st':     value => "status -bs";
    }
  }

  package {
    [
      'ssh-copy-id',
    ]:
    ensure => present,
  }

}
