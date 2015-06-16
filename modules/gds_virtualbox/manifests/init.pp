# Public: Install VirtualBox.app into /Applications.
#
# Examples
#
#   include gds_virtualbox

class gds_virtualbox($version = 'recommended') {
  case $version {
    '4.3.26':  { $url = 'http://download.virtualbox.org/virtualbox/4.3.26/VirtualBox-4.3.26-98988-OSX.dmg' }
    '4.2.22':  { $url = 'http://download.virtualbox.org/virtualbox/4.2.22/VirtualBox-4.2.22-91556-OSX.dmg' }
    default:   { $url = 'http://download.virtualbox.org/virtualbox/4.3.14/VirtualBox-4.3.14-95030-OSX.dmg' }
  }

  package { "VirtualBox":
    provider => 'pkgdmg',
    source   => $url
  }
}
