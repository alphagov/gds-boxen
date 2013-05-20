# Set up GDS ssh config
#
# Example
#
#    class { 'gds-ssh-config': extra => template("people/<user>/ssh_config_extras") }
class gds-ssh-config(
	$filename='config',
	$extra='',
) {
	file { "/Users/${::luser}/.ssh/${filename}":
		content => template('gds-ssh-config/config.erb'),
		ensure => present,
		mode   => '0644',
	}
}