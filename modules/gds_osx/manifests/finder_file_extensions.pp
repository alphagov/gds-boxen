# Shows file extensions and doesn't warn when the extension changes
class gds_osx::finder_file_extensions {
  exec { 'ql-text-selection':
    command => 'sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true && defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false && killall SystemUIServer'
  }
}