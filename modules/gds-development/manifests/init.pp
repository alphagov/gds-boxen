# Installs a GDS development environment
#
# Example:
#
#  include gds-development
#
class gds-development {
  # Puppet is used to make VMs
  include projects::puppet

  # Need Vagrant and Virtualbox
  include vagrant
  include virtualbox

  # Dev uses the vagrant-dns plugin
  vagrant::plugin { 'vagrant-dns': }

}
