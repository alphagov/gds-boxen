class people::jabley(
  $libreoffice_version = '4.3.6',
) {

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
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_vpn_profiles
  include gitx::dev
  include googledrive
  include handbrake
  include imagealpha
  include imageoptim
  include java
  class { 'libreoffice': version => $libreoffice_version }
  class { 'libreoffice::languagepack': version => $libreoffice_version }
  include licecap
  include onepassword
  include onepassword::chrome
  include openconnect
  include packer
  include paparazzi
  include r_studio
  include sublime_text_2
  include transmission
  include vmware_fusion
  include xbench


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
  include projects::transition-config
  include projects::router
  include projects::rummager
  include projects::whitehall

  include teams::performance-platform
  include teams::performance-platform::experimental
  include teams::efg
  class { 'teams::infrastructure': manage_gitconfig => false }
  include teams::trade-tariff

  repo::gds      { 'ertp': }
  repo::gds      { 'govuk_delivery': }
  repo::gds      { 'interviews': }
  repo::gds      { 'ida-boxes': }
  repo::gds      { 'ida-webops': }
  repo::gds      { 'licensify': }
  repo::gds      { 'router-data': }
  repo::gds      { 'saml-lib': }
  repo::gds      { 'transactions-visualisation': }

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-hostmanager': }
  vagrant::plugin { 'vagrant-vmware-fusion': }

  # All my SSH belong
  class { 'gds_ssh_config': }
  ssh_config::fragment {"user":
    content => template('people/jabley/ssh_config'),
  }

  ruby::version { '1.9.3-p484': }

  class { 'gds_development':
    version => '1.6.5',
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
      'cdrtools',
      'cloc',
      'cmake',
      'dos2unix',
      'ec2-api-tools',
      'faac',
      'ffmpeg',
      'flow',
      'gettext',
      'glew',
      'glm',
      'gmp',
      'gnu-typist',
      'groovy',
      'haskell-platform',
      'id3tool',
      'iperf',
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
      'pt',
      'python',
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
    provider => homebrew,
  }

  package { 'wireshark':
    ensure => present,
    install_options => [
      '--with-qt',
    ],
    provider => homebrew,
  }

  package {
    [
      'ansible',
      'bash-completion',
      'curl',
      'go',
      'gpg-agent',
      'graphviz',
      'heroku-toolbelt',
      'httperf',
      'lynx',
      'nmap',
      'p7zip',
      'parallel',
      'pbzip2',
      'pigz',
      'pngcrush',
      'pv',
      'R',
      'sbt',
      'scala',
      'ssh-copy-id',
      'sslscan',
      'tarsnap',
      'tree',
      'the_silver_searcher',
      'tmux',
      'youtube-dl',
    ]:
    ensure => 'latest',
    provider => homebrew,
  } ~> Exec['install_go_tools']

  package {'virtualenv':
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }

  class { 'nodejs::global': version => 'v0.10.33' }

  nodejs::version { 'v0.12.0': }

  nodejs::module { [
    'express-generator',
    'jsontool',
    'grunt-cli',
    'gulp',
    'keybase-installer',
    'node-inspector',
    'stackvis',
    'tick',
    ]:
    node_version => 'v0.10.33'
  }

  $home = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { [$projects]:
    ensure  => directory,
  }

  exec { 'install_go_tools':
    environment => ["GOPATH=${home}/gocode"],
    command => 'go get -u golang.org/x/tools/cmd/godoc \
                && go get -u golang.org/x/tools/cmd/vet \
                && go get -u golang.org/x/tools/cmd/goimports \
                && go get -u code.google.com/p/go.blog/blog \
                && go get -u github.com/jabley/train/cmd/train \
                && go get -u github.com/alphagov/gds-present \
                && go get -u rsc.io/grind'
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
    value => '16384'
  }
  sysctl::set { 'kern.maxfilesperproc':
    value => '16384'
  }
}
