# Public: Install Google Drive.app into /Applications.
#
# Examples
#
#   include googledrive
class googledrive {
  package { 'Google Drive':
    provider => 'appdmg',
    source   => 'http://dl.google.com/drive/installgoogledrive.dmg'
  }
}
