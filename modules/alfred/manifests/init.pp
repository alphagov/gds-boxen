# Public: Install Alfred.app into /Applications.
#
# Examples
#
#   include alfred
class alfred {
  package { 'Alfred':
    provider => 'compressed_app',
    source   => 'http://cachefly.alfredapp.com/alfred_1.3.3_267.zip'
  }
}
