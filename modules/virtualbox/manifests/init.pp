# Public: Install VirtualBox.app into /Applications.
#
# Examples
#
#   include virtualbox
class virtualbox {
  package { 'VirtualBox':
    provider => 'pkgdmg',
    source   => 'http://download.virtualbox.org/virtualbox/4.2.6/VirtualBox-4.2.6-82870-OSX.dmg'
  }
}
