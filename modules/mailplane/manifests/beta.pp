# Public: Install Mailplane.app into /Applications.
#
# Examples
#
#   include mailplane::beta

# This is the Mailplane 3 beta

class mailplane::beta {
  package { 'Mailplane':
    provider => 'compressed_app',
    source   => 'http://dist.mailplaneapp.com/builds/Mailplane_3_598.tbz'
  }
}
