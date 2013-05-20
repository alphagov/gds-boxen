# Set up GDS ssh config
#
# Example
#
#    include gds-ssh-config
class gds-ssh-config($filename='config') {
	file { "/Users/${::luser}/.ssh/${filename}":
		source => 'puppet:///modules/gds-ssh-config/config',
		ensure => present,
		mode   => '0644',
	}	
}