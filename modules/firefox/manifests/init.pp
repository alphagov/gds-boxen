# Public: Install Firefox.app into /Applications.
#
# Examples
#
#   include firefox
class firefox {
  package { 'Firefox':
    provider => 'appdmg',
    source   => 'http://download.cdn.mozilla.net/pub/mozilla.org/firefox/releases/18.0.2/mac/en-US/Firefox%2018.0.2.dmg'
  }
}
