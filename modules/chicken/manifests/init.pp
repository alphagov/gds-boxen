# Public: Install Chicken.app into /Applications.
#
# Examples
#
#   include chicken
class chicken {
  package { 'Chicken':
      provider => 'appdmg',
      source   => 'http://freefr.dl.sourceforge.net/project/chicken/Chicken-2.2b2.dmg'
  }
}
