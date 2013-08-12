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

  # Make sure we remove the old gems
  ruby::gem {"vagrant-1.8.7":
    gem     => 'vagrant',
    ruby    => '1.8.7',
    require => Class['ruby::1_8_7'],
    ensure  => absent,
  }
  ruby::gem {"vagrant-1.9.2":
    gem     => 'vagrant',
    ruby    => '1.9.2',
    require => Class['ruby::1_9_2'],
    ensure  => absent,
  }
  ruby::gem {"vagrant-1.9.3":
    gem     => 'vagrant',
    ruby    => '1.9.3',
    require => Class['ruby::1_9_3'],
    ensure  => absent,
  }
}
