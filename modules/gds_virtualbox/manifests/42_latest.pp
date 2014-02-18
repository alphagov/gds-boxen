class gds_virtualbox::42_latest {
  package { 'VirtualBox-42_latest':
    provider => 'pkgdmg',
    source   => 'http://download.virtualbox.org/virtualbox/4.2.22/VirtualBox-4.2.22-91556-OSX.dmg',
  }
}
