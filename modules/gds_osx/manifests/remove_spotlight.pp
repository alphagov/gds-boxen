# Removes Spotlight search
class gds_osx::remove_spotlight {
  exec { 'mv-spotlight':
    command => 'sudo mv /System/Library/CoreServices/Search.bundle /System/Library/CoreServices/Search.bundle.bak && killall SystemUIServer',
    unless  => 'test ! -e /System/Library/CoreServices/Search.bundle',
  }
}
