# Allows text to be selected from a file when viewed in quicklook.
class gds_osx::quicklook_text_selection {
  exec { 'ql-text-selection':
    command => 'sudo defaults write com.apple.finder QLEnableTextSelection -bool true && killall SystemUIServer'
  }
}
