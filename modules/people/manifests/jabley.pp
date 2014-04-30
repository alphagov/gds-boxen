class people::jabley {
  include adium
  include alfred
  include android_file_transfer
  include android::sdk
  include banshee
  include caffeine
  include clojure
  include chrome
  include dropbox
  include evernote
  include firefox
  include flux
  include freeplane
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_vpn_profiles
  include git
  include gitx::dev
  include gnupg
  include googledrive
  include handbrake
  include imagealpha
  include imageoptim
  include java
  include libreoffice
  include libreoffice::languagepack
  include nodejs::v0_10
  include onepassword
  include onepassword::chrome
  include openconnect
  include packer
  include paparazzi
  include postgresql
  include r_studio
  include slack
  include sublime_text_2
  include travis
  include transmission
  include vagrant
  include vmware_fusion


  include projects::alphagov-deployment
  include projects::blinken
  include projects::blinken-config
  include projects::calculators
  include projects::ci-deployment
  include projects::development
  include projects::fabric-scripts
  include projects::frontend
  include projects::govuk_content_api
  include projects::private-utils
  include projects::puppet
  include projects::redirector
  include projects::router
  include projects::rummager
  include projects::whitehall

  include teams::performance-platform
  include teams::efg
  class { 'teams::infrastructure': manage_gitconfig => false }
  include teams::trade-tariff

  repo::alphagov { 'asset-manager': }
  repo::alphagov { 'design-patterns': }
  repo::alphagov { 'government-service-design-manual': }
  repo::alphagov { 'passphrase_entropy': }
  repo::alphagov { 'packager': }
  repo::alphagov { 'puppet-gstatsd': }
  repo::alphagov { 'puppet-logstash': }
  repo::alphagov { 'puppet-nginx': }
  repo::alphagov { 'puppet-ssl': }
  repo::alphagov { 'service-domain-checker': }
  repo::alphagov { 'servicechecker': }
  repo::alphagov { 'transition-stats': }
  repo::alphagov { 'transformation-dashboard': }
  repo::alphagov { 'vcloud-tools': }
  repo::gds      { 'govuk_delivery': }
  repo::gds      { 'interviews': }
  repo::gds      { 'licensify': }
  repo::gds      { 'router-data': }
  repo::gds      { 'transactions-visualisation': }

  vagrant::plugin { 'vagrant-vmware-fusion': }

  class { 'intellij':
      edition => 'community',
      version => '13.0.2',
  }

  homebrew::tap { 'homebrew/science': }
  homebrew::tap { 'homebrew/completions': }

  # version control this file, since it's in another repo and I don't really
  # want to delete it by accident.
  file {"${boxen::config::srcdir}/puppet/development/Vagrantfile.localconfig":
    source => 'puppet:///modules/people/jabley/Vagrantfile.localconfig',
    require => Class['Projects::Puppet']
  }

  file {"${boxen::config::srcdir}/pp-development/pp-development-1-Vagrantfile.localconfig":
    source => 'puppet:///modules/people/jabley/pp-development-1-Vagrantfile.localconfig',
    require => Class['Teams::Performance-Platform']
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
      'graphviz',
      'groovy',
      'heroku-toolbelt',
      'httperf',
      'id3tool',
      'jpeg',
      'lame',
      'logstalgia',
      'lynx',
      'maven',
      'md5sha1sum',
      'mercurial',
      'mobile-shell',
      'mysql',
      'nmap',
      'oniguruma',
      'p7zip',
      'parallel',
      'pcre',
      'phantomjs',
      'pidof',
      'pigz',
      'play',
      'pkg-config',
      'pngcrush',
      'proctools',
      'protobuf',
      'python',
      'pv',
      'R',
      'redis',
      's3cmd',
      'sbt',
      'scala',
      'sdl',
      'sdl_image',
      'sloccount',
      'smartmontools',
      'ssh-copy-id',
      'sslscan',
      'tarsnap',
      'the_silver_searcher',
      'tmux',
      'wget',
      'wrk',
      'unrar',
      'vagrant-completion',
      'x264',
      'xvid',
      'yasm',
      'youtube-dl',
    ]:
    ensure => 'present',
  }

  package {'virtualenv':
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }


  nodejs::module { 'jsontool': node_version => 'v0.10' }

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
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores
  osx::recovery_message { 'If found, please call +447827 880 857': }

  class {'boxen::security': screensaver_delay_sec => 0 }
}
