class people::jabley {
  include adium
  include alfred
  include caffeine
  include clojure
  include chrome
  include dropbox
  include firefox
  include googledrive
  include git
  include gitx::dev
  include gnupg
  include java
  include openconnect
  include transmission
  include turn-off-dashboard
  include vagrant_gem
  include vagrant-dns
  include virtualbox

  include projects::alphagov-deployment
  include projects::development
  include projects::frontend
  include projects::govuk_frontend_toolkit
  include projects::private-utils
  include projects::puppet
  include projects::redirector
  include projects::rummager
  include projects::smokey
  include projects::static
  include projects::whitehall

  include teams::performance-platform
  include teams::efg
  include teams::hmrc
  include teams::trade-tariff
  repo::gds      { 'govuk_delivery': }
  repo::gds      { 'transactions-visualisation': }
  repo::alphagov { 'passphrase_entropy': }
  
  class { 'intellij':
      edition => 'community',
  }

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
      'go',
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
      'play',
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
      'unrar',
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

  # Settings from puppet-osx
  include osx::disable_app_quarantine
  include osx::dock::2d
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores
  osx::recovery_message { 'If found, please call +447827 880 857': }

  class security inherits boxen::security {
    Boxen::Osx_defaults['short delay for password dialog on screensaver'] {
      value  => 0,
    }
  }

  include security

}
