# manage user ssh config
# uses puppetlabs-concat to enable separate sections to be managed separately
class ssh_config {
    include concat::setup
    $path = "/Users/${::luser}/.ssh/config"
    concat { $path:
      mode    => '0644',
      owner   => $::luser,
      group   => 'staff',
    }
}
