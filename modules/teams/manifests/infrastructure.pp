class teams::infrastructure {
  include projects::alphagov-deployment
  include projects::development
  include projects::env-sync-and-backup
  include projects::fabric-scripts
  include projects::jenkins-config
  include projects::private-utils
  include projects::puppet
  include projects::smokey
  include projects::vcloud-provisioner
}
