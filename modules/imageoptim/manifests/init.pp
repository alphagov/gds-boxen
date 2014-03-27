# Public: Install ImageOptim to /Applications
#
# See http://imageoptim.com/
#
# Sample Usage:
#
#  include imageoptim
#
class imageoptim {
  package { 'ImageOptim':
    provider => 'compressed_app',
    source   => 'http://imageoptim.com/ImageOptim1.5.3.tar.bz2'
  }
}

