class people::jabley {
  include adium
  include alfred
  include caffeine
  include chrome
  include dropbox
  include firefox
  include git
  include gnupg
  include turn-off-dashboard
  include vagrant
  include vagrant-dns
  include virtualbox
  include wget

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment

  # These are all Homebrew packages
  package {
    [
      'ack',
      'ascii',
      'bash-completion',
      'boost',
      'bsdmake',
      'cloc',
      'cmake',
      'dos2unix',
      'ec2-api-tools',
      'emacs',
      'faac',
      'ffmpeg',
      'gettext',
      'git',
      'glew',
      'glm',
      'gmp',
      'gnu-typist',
      'gource',
      'groovy',
      'httperf',
      'id3tool',
      'jpeg',
      'lame',
      'leiningen',
      'lynx',
      'maven',
      'md5sha1sum',
      'mobile-shell',
      'mysql',
      'nmap',
      'node',
      'oniguruma',
      'p7zip',
      'parallel',
      'pcre',
      'pidof',
      'pigz',
      'pkg-config',
      'pngcrush',
      'proctools',
      'protobuf',
      'pv',
      'rbenv',
      'redis',
      'redo',
      'ruby-build',
      'sbt',
      'scala',
      'sdl',
      'sdl_image',
      'sloccount',
      'ssh-copy-id',
      'tmux',
      'wget',
      'wrk',
      'x264',
      'xvid',
      'yasm',
    ]:
    ensure => 'present',
  }

  $home = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { [$projects]:
    ensure  => directory,
  }
}
