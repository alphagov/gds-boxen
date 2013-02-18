class people::samjsharpe {
  include adium
  include alfred
  include chicken
  include chrome
  include dropbox
  include firefox
  include git-pulls
  include git-remote-branch
  include googledrive
  include iterm2::stable
  include macvim
  include mailplane::beta
  include mplayerx
  include onepassword
  include screen
  include skype
  include slate
  include turn-off-dashboard
  include theunarchiver
  include virtualbox
  include zsh

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment

  # These are all Homebrew packages
  package {
    [
      'autoconf', 'autojump', 'automake', 'bdw-gc', 'boost', 'brew-pip',
      'cabextract', 'coreutils', 'ctags', 'encfs', 'fdupes', 'fuse4x',
      'fuse4x-kext', 'gdbm', 'gettext', 'git', 'git-extras', 'git-flow',
      'gnupg', 'go', 'jasper', 'jpeg', 'legit', 'libicns',
      'libpng', 'libpst', 'libtool', 'libyaml', 'nmap', 'ntfs-3g', 'openssl',
      'parallel', 'pcre', 'pkg-config', 'rdesktop', 'readline', 'rename',
      'renameutils', 'rlog', 's3cmd', 'sslscan', 'unrar', 'w3m', 'wget', 'xz',
      'youtube-dl', 'zsh-completions', 'zsh-lovers'
    ]:
    ensure => present,
  }
}
