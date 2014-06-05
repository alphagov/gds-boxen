class wireshark($version='1.10.7') {
  package { 'Wireshark':
    source   => "http://wiresharkdownloads.riverbed.com/wireshark/osx/Wireshark%20${version}%20Intel%2064.dmg",
    provider => 'pkgdmg',
  }
}
