# Public: Install MplayerX.app into /Applications.
#
# Examples
#
#   include mplayerx
class mplayerx {
  package { 'MPlayerX':
      provider => 'compressed_app',
      source   => 'http://mplayerx.googlecode.com/files/MPlayerX-1.0.17.zip'
  }
}
