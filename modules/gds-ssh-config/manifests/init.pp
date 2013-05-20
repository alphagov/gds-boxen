# Set up GDS ssh config
#
# Example
#
#    include gds-ssh-config
class gds-ssh-config {
	file { "/Users/${::luser}/.ssh/config":
		source => 'puppet:///modules/gds-ssh-config/config',
		ensure => present,
		mode   => '0644',
	}	
}