# Public: Install Slate.app into /Applications.
#
# Examples
#
#   include slate
class slate {
  package { 'Slate':
      provider => 'appdmg',
      source   => 'http://slate.ninjamonkeysoftware.com/Slate.dmg'
  }
}
