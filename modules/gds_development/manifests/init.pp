# Installs a GDS development environment
#
# Example:
#
#  include gds_development
#
class gds_development {
  # Puppet is used to make VMs
  include projects::puppet

  # Need Vagrant and Virtualbox
  include vagrant
  include gds_virtualbox

  # Dev uses the vagrant-dns plugin
  vagrant::plugin { 'vagrant-dns': }

  # Make sure we remove the old gems
  ruby::all::gem {'vagrant':
    ensure => absent,
  }
}
