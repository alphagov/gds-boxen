# Closed: Installs resolv.conf entry for *.gds
#
# Example
#
#   include gds-resolver

class gds-resolver {
  osx_resolver::domain { 'gds':
    content => 'nameserver 192.168.19.254
',
  }
}
