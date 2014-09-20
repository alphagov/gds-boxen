class freeplane {
  package { 'Freeplane':
    provider => "appdmg",
    source => "http://downloads.sourceforge.net/project/freeplane/freeplane%20stable/freeplane_app-1.3.12.dmg",
  }
}
