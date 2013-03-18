# Public: Install Emacs.app into /Applications.
#
# Examples
#
#   include emacs::stable

class emacs::stable {
  package { 'Emacs':
    provider => 'appdmg',
    source   => 'http://emacsformacosx.com/emacs-builds/Emacs-24.3-universal-10.6.8.dmg',
    notify   => 'fix-emacs-termcap',
  }

  # So ansi-term behaves itself
  exec { 'fix-emacs-termcap':
    command     => 'tic -o ~/.terminfo /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti',
    refreshonly => true,
  }
}
