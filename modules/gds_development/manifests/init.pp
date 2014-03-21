# Installs a GDS development environment
#
# Example:
#
#  include gds_development
#
class gds_development($version = '1.4.2') {
  # Puppet is used to make VMs
  include projects::puppet

  # Need Vagrant and Virtualbox
  class { 'vagrant':
    version => $version,
  }
  include gds_virtualbox

  # Dev uses the vagrant-dns plugin
  vagrant::plugin { 'vagrant-dns': }

  # Make sure we remove the old gems
  ruby::all::gem {'vagrant':
    ensure => absent,
  }
}
