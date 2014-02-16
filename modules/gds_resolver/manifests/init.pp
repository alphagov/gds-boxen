# Closed: Installs /etc/resolver entry for *.gds
#
# Example
#
#   include gds_resolver

class gds_resolver {
  osx_resolver::domain { 'gds':
    content => 'nameserver 192.168.19.254
',
  }
}
