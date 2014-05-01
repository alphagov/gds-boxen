# Public: Install Mailplane 3.app into /Applications.
#
# Examples
#
#   include mailplane

class mailplane {
  package { 'Mailplane 3':
    provider => 'compressed_app',
    source   => 'http://dist.mailplaneapp.com/builds/Mailplane_3_939.tbz',
  }
}
