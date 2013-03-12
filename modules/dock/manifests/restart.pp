# Public: Restart the Dock to pick up changes to defaults.
#
# Examples
#
#   include dock::restart
#   boxen::osx_defaults { 'foo':
#     ..
#     notify => Class['dock::restart'],
#   }
#
class dock::restart {
  exec { 'restart dock':
    command     => 'killall -1 Dock',
    refreshonly => true,
  }
}
