class teams::infrastructure ($manage_gitconfig = true) {
  include projects::alphagov-deployment
  include projects::boxes
  include projects::ci-puppet
  include projects::development
  include projects::env-sync-and-backup
  include projects::fabric-scripts
  include projects::ghtools
  include projects::govuk_mirror
  include projects::govuk_offsitebackups-puppet
  include projects::govuk-provisioning
  include projects::govuk_redirector-puppet
  include projects::opsmanual
  include projects::packager
  include projects::private-utils
  include projects::puppet
  include projects::smokey
  include projects::vagrant-govuk
  repo::alphagov { 'nagios-plugins': }
  repo::alphagov { 'cdn-acceptance-tests': }

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
