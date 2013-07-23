# Public: Install Android File Transfer to /Applications
#
# Sample Usage:
#
#  include android-file-transfer
#
class android-file-transfer {
  package { 'AndroidFileTransfer':
    provider => 'appdmg',
    source   => 'https://dl.google.com/dl/androidjumper/mtp/current/androidfiletransfer.dmg'
  }
}
