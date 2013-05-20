# Public: Install Omnifocus.app into /Applications.
#
# Examples
#
#   include omnifocus
class omnifocus {
  package { 'OmniFocus':
    provider => 'appdmg_eula',
    source   => 'http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.6/OmniFocus-1.10.4.dmg'
  }
}
