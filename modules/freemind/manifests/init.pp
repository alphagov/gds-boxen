# Public: Install FreeMind
#
# Examples
#
#   include freemind
class freemind {
  package { 'FreeMind':
      provider => 'appdmg',
      source   => 'http://netcologne.dl.sourceforge.net/project/freemind/freemind/0.9.0/FreeMind_0.9.0.dmg'
  }
}
