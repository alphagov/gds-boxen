class transmission {
  package { 'Transmission':
    source   => 'http://download.transmissionbt.com/files/Transmission-2.77.dmg',
    provider => appdmg
  }
}
