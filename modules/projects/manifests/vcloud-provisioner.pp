# Pulls the https://github.com/alphagov/puppet repository
class projects::vcloud-provisioner {
  repo::gds { 'vcloud-provisioner': }
}
