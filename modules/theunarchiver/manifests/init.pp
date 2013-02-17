# Public: Install TheUnarchiver.app into /Applications.
#
# Examples
#
#   include theunarchiver
class theunarchiver {
  package { 'TheUnarchiver':
    provider => 'compressed_app',
    source   => 'http://theunarchiver.googlecode.com/files/TheUnarchiver3.6.1.zip'
  }
}
