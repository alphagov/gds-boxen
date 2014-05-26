class gds_virtualbox::latest {
  package { 'VirtualBox_latest':
    provider => 'pkgdmg',
    source   => 'http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-OSX.dmg',
  }
}
