# Public: Install licecap.app into /Applications.
#
# It's a tool for taking a capture of your desktop and generating a .GIF
# http://www.cockos.com/licecap/
#
# Examples
#
#   include licecap
class licecap {
  package { 'LICEcap':
    provider => 'appdmg_eula',
    source   => 'http://www.cockos.com/licecap/licecap124.dmg'
  }
}
