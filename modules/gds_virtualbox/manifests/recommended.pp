class gds_virtualbox::recommended {
  package { 'VirtualBox':
    provider => 'pkgdmg',
    source   => 'http://download.virtualbox.org/virtualbox/4.3.14/VirtualBox-4.3.14-95030-OSX.dmg'
  }
}
