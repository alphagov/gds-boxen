class calibre {
  package {'calibre':
    provider => 'appdmg',
    source   => 'http://calibre-ebook.googlecode.com/files/calibre-0.9.23.dmg',
  }
}
