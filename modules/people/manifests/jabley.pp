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
  include emacs::formacosx
  include evernote
  include firefox
  include flux
  include freeplane
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_vpn_profiles
  include gitx::dev
  include googledrive
  include handbrake
  include imagealpha
  include imageoptim
  include java
  class { 'libreoffice': version => '4.2.5' }
  class { 'libreoffice::languagepack': version => '4.2.5' }
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
  include transmission
  include vmware_fusion


  include projects::alphagov-deployment
  include projects::blinken
  include projects::blinken-config
  include projects::calculators
  include projects::ci-deployment
  include projects::deployment::creds
  include projects::development
  include projects::fabric-scripts
  include projects::frontend
  include projects::govuk_content_api
  include projects::private-utils
  include projects::redirector
  include projects::router
  include projects::rummager
  include projects::whitehall
  include projects::vcloud-core
  include projects::vcloud-walker

  include teams::performance-platform
  include teams::performance-platform::experimental
  include teams::efg
  class { 'teams::infrastructure': manage_gitconfig => false }
  include teams::trade-tariff

  repo::alphagov { 'asset-manager': }
  repo::alphagov { 'cdn-acceptance-tests': }
  repo::alphagov { 'design-patterns': }
  repo::alphagov { 'external-link-tracker': }
  repo::alphagov { 'government-service-design-manual': }
  repo::alphagov { 'govuk_crawler_worker': }
  repo::alphagov { 'passphrase_entropy': }
  repo::alphagov { 'packager': }
  repo::alphagov { 'puppet-gstatsd': }
  repo::alphagov { 'puppet-logstash': }
  repo::alphagov { 'puppet-nginx': }
  repo::alphagov { 'puppet-ssl': }
  repo::alphagov { 'sensu-community-plugins': }
  repo::alphagov { 'service-domain-checker': }
  repo::alphagov { 'servicechecker': }
  repo::alphagov { 'transition-stats': }
  repo::alphagov { 'transformation-dashboard': }
  repo::gds      { 'govuk_delivery': }
  repo::gds      { 'interviews': }
  repo::gds      { 'licensify': }
  repo::gds      { 'router-data': }
  repo::gds      { 'saml-lib': }
  repo::gds      { 'transactions-visualisation': }

  vagrant::plugin { 'vagrant-vmware-fusion': }

  # All my SSH belong
  class { 'gds_ssh_config': }
  class { 'teams::performance-platform::ssh': }
  ssh_config::fragment {"user":
    content => template('people/jabley/ssh_config'),
  }

  ruby::version { '1.9.3-p484': }

  class { 'gds_development':
    version => '1.6.3',
  }

  class { 'intellij':
      edition => 'community',
      version => '13.0.2',
  }

  homebrew::tap { 'homebrew/science': }

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
      'boost',
      'bsdmake',
      'cdrtools',
      'cloc',
      'cmake',
      'dos2unix',
      'ec2-api-tools',
      'faac',
      'ffmpeg',
      'gettext',
      'glew',
      'glm',
      'gmp',
      'gnu-typist',
      'groovy',
      'haskell-platform',
      'id3tool',
      'jpeg',
      'lame',
      'logstalgia',
      'maven',
      'md5sha1sum',
      'mercurial',
      'mobile-shell',
      'mysql',
      'oniguruma',
      'pcre',
      'phantomjs',
      'pidof',
      'pkg-config',
      'play22',
      'proctools',
      'protobuf',
      'redis',
      'sdl',
      'sdl_image',
      'sloccount',
      'smartmontools',
      'tesseract',
      'unrar',
      'valgrind',
      'wget',
      'x264',
      'xvid',
      'yasm',
    ]:
    ensure => 'present',
  }

  package {
    [
      'bash-completion',
      'go',
      'graphviz',
      'heroku-toolbelt',
      'httperf',
      'lynx',
      'nmap',
      'p7zip',
      'parallel',
      'pigz',
      'pngcrush',
      'python',
      'pv',
      'R',
      's3cmd',
      'sbt',
      'scala',
      'ssh-copy-id',
      'sslscan',
      'tarsnap',
      'tree',
      'the_silver_searcher',
      'tmux',
      'wrk',
      'youtube-dl',
    ]:
    ensure => 'latest',
  }

  package {'virtualenv':
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }


  nodejs::module { [
    'jsontool',
    'grunt-cli',
    ]:
    node_version => 'v0.10'
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
  include osx::finder::show_hidden_files
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores
  osx::recovery_message { 'If found, please call +447827 880 857': }

  sysctl::set { 'kern.maxfiles':
    value => '32000'
  }
  sysctl::set { 'kern.maxfilesperproc':
    value => '28000'
  }
}
