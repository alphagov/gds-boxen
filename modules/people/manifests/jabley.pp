class people::jabley {
  include adium
  include alfred
  include caffeine
  include chrome
  include dropbox
  include firefox
  include git
  include gitx::l
  include gnupg
  include openconnect
  include transmission
  include turn-off-dashboard
  include vagrant
  include vagrant-dns
  include virtualbox

  include teams::performance-platform
  include teams::efg
  include teams::trade-tariff
  
  # These are all Homebrew packages
  package {
    [
      'ascii',
      'bash-completion',
      'boost',
      'bsdmake',
      'cdrtools',
      'cloc',
      'cmake',
      'dos2unix',
      'ec2-api-tools',
      'emacs',
      'faac',
      'ffmpeg',
      'gettext',
      'glew',
      'glm',
      'gmp',
      'gnu-typist',
      'groovy',
      'httperf',
      'id3tool',
      'jpeg',
      'lame',
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
      'redis',
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
      'youtube-dl',
    ]:
    ensure => 'present',
  }

  $home = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { [$projects]:
    ensure  => directory,
  }
}
