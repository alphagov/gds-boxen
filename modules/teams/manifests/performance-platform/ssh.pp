# Set up Performance Platform ssh config
#
# Example
#
#    class { 'teams::performance-platform::ssh': }
class teams::performance-platform::ssh {
  ssh_config::fragment {"performance_platform_ssh":
    content => template('teams/performance-platform/ssh-config'),
  }
}
