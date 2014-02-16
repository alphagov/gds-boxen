# Public: Install Android File Transfer to /Applications
#
# Sample Usage:
#
#  include android_file_transfer
#
class android_file_transfer {
  package { 'AndroidFileTransfer':
    provider => 'appdmg',
    source   => 'https://dl.google.com/dl/androidjumper/mtp/current/androidfiletransfer.dmg'
  }
}
