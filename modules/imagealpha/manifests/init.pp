# Public: Install ImageAlpha to /Applications
#
# See http://pngmini.com/
#
# Sample Usage:
#
#  include imagealpha
#
class imagealpha {
  package { 'ImageAlpha':
    provider => 'compressed_app',
    source   => 'http://pngmini.com/ImageAlpha1.3.5.tar.bz2'
  }
}
