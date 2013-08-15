# Set up GDS ssh config
#
# Example
#
#    class { 'gds-ssh-config': extra => template("people/<user>/ssh_config_extras") }
class gds-ssh-config(
	$filename='config',
	$extra='',
) {
    include concat::setup
    $path = "/Users/${::luser}/.ssh/${filename}"
    concat { $path:
      mode    => '0644',
      owner   => $::luser,
      group   => 'staff',
    }
    concat::fragment {"govuk_ssh":
      target => $path,
      source => 'puppet:///modules/gds-ssh-config/gds_ssh_config',
      order  => '10',
    }
    concat::fragment {"extra":
      target  => $path,
      content => $extra,
      order   => '20',
    }
}
