# When connecting a new volume to the machine it disables the prompt to use the new volume as a time machine
class gds_osx::disable_timemachine {
  exec { 'disable-timemachine':
    command => 'sudo defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true && killall SystemUIServer'
  }
}