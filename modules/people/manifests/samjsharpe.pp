class people::samjsharpe {
  include adium
  include alfred
  include caffeine
  include chicken
  include chrome
  include colloquy
  include dropbox
  include firefox
  include git-pulls
  include git-remote-branch
  include googledrive
  include iterm2::stable
  include macvim
  include mplayerx
  include onepassword
  include screen
  include skype
  include slate
  include sparrow
  include sublime_text_2
  include turn-off-dashboard
  include theunarchiver
  include virtualbox
  include xquartz
  include zsh

  include projects::development
  include projects::puppet

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
