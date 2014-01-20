# Public: Install Alfred.app into /Applications.
#
# Examples
#
#   include alfred::two
class alfred::two {
  package { 'Alfred 2':
    provider => 'compressed_app',
    source   => 'http://cachefly.alfredapp.com/Alfred_2.1.1_227.zip'
  }
}
