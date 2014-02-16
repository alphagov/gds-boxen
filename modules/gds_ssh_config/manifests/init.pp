# Set up GDS ssh config
#
# Example
#
#    class { 'gds_ssh_config': }
class gds_ssh_config {
    ssh_config::fragment {"govuk_ssh":
      source => 'puppet:///modules/gds_ssh_config/gds_ssh_config',
    }
}
