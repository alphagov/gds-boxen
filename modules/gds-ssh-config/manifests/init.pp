# Set up GDS ssh config
#
# Example
#
#    class { 'gds-ssh-config': extra => template("people/<user>/ssh_config_extras") }
class gds-ssh-config(
	$filename='config',
	$extra='',
) {
    ssh_config::fragment {"govuk_ssh":
      source => 'puppet:///modules/gds-ssh-config/gds_ssh_config',
    }
    ssh_config::fragment {"extra":
      content => $extra,
    }
}
