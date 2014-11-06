class wireshark($version='1.12.1') {
  package { 'Wireshark':
    source   => "http://wiresharkdownloads.riverbed.com/wireshark/osx/Wireshark%20${version}%20Intel%2064.dmg",
    provider => 'pkgdmg',
  }
}
