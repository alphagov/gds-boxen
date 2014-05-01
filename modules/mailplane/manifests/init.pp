# Public: Install Mailplane 3.app into /Applications.
#
# Examples
#
#   include mailplane

class mailplane {
  package { 'Mailplane 3':
    provider => 'compressed_app',
    source   => 'http://update.mailplaneapp.com/mailplane_3.php'
  }
}
