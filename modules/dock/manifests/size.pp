# Public: Set the tile height of the Dock. May only be called once.
#
# Examples
#
#   dock::size { 50: }
define dock::size() {
  include dock::restart

  if $title !~ /^\d+$/ {
    fail('dock::size: title must be an integer')
  }

  if defined(Boxen::Osx_defaults['dock size']) {
    fail('dock::size: may only be called once')
  }

  boxen::osx_defaults { 'dock size':
    domain  => 'com.apple.dock',
    key     => 'tilesize',
    value   => $title,
    type    => 'int',
    user    => $::luser,
    notify  => Class['dock::restart'],
  }
}
