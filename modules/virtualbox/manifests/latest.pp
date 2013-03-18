class virtualbox::latest {
  package { 'VirtualBox-latest':
    provider => 'pkgdmg',
    source   => 'http://download.virtualbox.org/virtualbox/4.2.10/VirtualBox-4.2.10-84104-OSX.dmg',
  }
}
