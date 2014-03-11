class teams::infrastructure ($manage_gitconfig = true) {
  include projects::alphagov-deployment
  include projects::box-templates
  include projects::boxes
  include projects::boxgrinder-appliances
  include projects::boxmaker
  include projects::ci-puppet
  include projects::development
  include projects::env-sync-and-backup
  include projects::fabric-scripts
  include projects::ghtools
  include projects::govuk_mirror
  include projects::govuk-provisioning
  include projects::govuk_redirector-deployment
  include projects::govuk_redirector-puppet
  include projects::machine-bootstrap
  include projects::opsmanual
  include projects::packages
  include projects::private-utils
  include projects::puppet
  include projects::smokey
  include projects::vagrant-govuk
  include projects::vcloud-provisioner
  include projects::vcloud-templates
  include projects::vcloudtools

  if $manage_gitconfig {
    git::config::global {
      'alias.st':     value => "status -bs";
    }
  }
}
