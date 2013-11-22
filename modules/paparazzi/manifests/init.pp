# Public: Install Paparazzi.app into /Applications.
#
# It's a tool for taking screenshots of URLs
# http://derailer.org/paparazzi/
#
# Examples
#
#   include paparazzi
class paparazzi {
  package { 'Paparazzi':
    provider => 'appdmg',
    source   => 'http://derailer.org/paparazzi/Paparazzi!%200.6.7.dmg'
  }
}
