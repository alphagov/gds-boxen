# Closed: Installs /etc/resolver entry for *.gds
#
# Example
#
#   include gds_resolver

class gds_resolver {
  file {'/etc/resolver/gds':
    ensure => absent;
  }
}
