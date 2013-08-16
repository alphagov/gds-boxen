# Set up GDS ssh config
#
# Example
#
#    class { 'gds-ssh-config': }
class gds-ssh-config {
    ssh_config::fragment {"govuk_ssh":
      source => 'puppet:///modules/gds-ssh-config/gds_ssh_config',
    }
}
