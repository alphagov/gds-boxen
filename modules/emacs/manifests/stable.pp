# Public: Install Emacs.app into /Applications.
#
# Examples
#
#   include emacs::stable

class emacs::stable {
  package { 'Emacs':
    provider => 'appdmg',
    source   => 'http://emacsformacosx.com/emacs-builds/Emacs-24.2-universal-10.6.8.dmg'
  }
}
