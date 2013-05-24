class freeplane {
  package { 'Freeplane':
    provider => "appdmg",
    source => "http://netcologne.dl.sourceforge.net/project/freeplane/freeplane%20stable/freeplane_app-1.2.23_01.dmg",
  }
}
