class people::jabley(
  $libreoffice_version = '4.3.6',
  $node_version = '0.10.36',
) {

  include adium
  include alfred
  include android_file_transfer
  include banshee
  include caffeine
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
  include imagealpha
  include imageoptim
  class { 'libreoffice': version => $libreoffice_version }
  class { 'libreoffice::languagepack': version => $libreoffice_version }
  include licecap
  include onepassword
  include onepassword::chrome
  include openconnect
  include paparazzi
  include sublime_text_2
  include skype
  include vmware_fusion
  include xbench


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
  include projects::static
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

  class { 'gds_development':
    version => '1.7.4',
  }

  class { 'gds_printers':
    ldap_username => 'jamesabley',
  }

  homebrew::tap { 'homebrew/science': }

  homebrew::tap { 'homebrew/binary': }
  package { 'packer': }

  # version control this file, since it's in another repo and I don't really
  # want to delete it by accident.
  file {"${boxen::config::srcdir}/puppet/development/Vagrantfile.localconfig":
    source => 'puppet:///modules/people/jabley/Vagrantfile.localconfig',
    require => Class['Projects::Puppet']
  }

  # These are all Homebrew packages
  package {
    [
      'android-sdk',
      'ascii',
      'brew-cask',
      'cabal-install',
      'cdrtools',
      'cloc',
      'cmake',
      'dos2unix',
      'ec2-api-tools',
      'gettext',
      'ghc',
      'glew',
      'glm',
      'gmp',
      'gnu-typist',
      'groovy',
      'id3tool',
      'iperf',
      'jpeg',
      'lame',
      'logstalgia',
      'luajit',
      'maven',
      'md5sha1sum',
      'mercurial',
      'mobile-shell',
      'ocaml',
      'oniguruma',
      'pandoc',
      'pcre',
      'pidof',
      'pkg-config',
      'play22',
      'potrace',
      'postgresql',
      'proctools',
      'protobuf',
      'python3',
      'rust',
      'sdl',
      'sdl_image',
      'shellcheck',
      'sloccount',
      'smartmontools',
      'terraform',
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

  package {
    [
      'ansible',
      'bash-completion',
      'boot2docker',
      'curl',
      'docker',
      'docker-compose',
      'docker-machine',
      'go',
      'gpg-agent',
      'graphviz',
      'heroku-toolbelt',
      'httperf',
      'leiningen',
      'lynx',
      'nmap',
      'p7zip',
      'parallel',
      'pbzip2',
      'pigz',
      'pngcrush',
      'pv',
      'sbt',
      'scala',
      'tarsnap',
      'tree',
      'the_platinum_searcher',
      'the_silver_searcher',
      'tmux',
      'vegeta',
      'wrk',
      'youtube-dl',
    ]:
    ensure => 'latest',
    provider => homebrew,
  } ~> Exec['install_go_tools']

  package { 'vlc':
    provider => 'appdmg',
    source   => "http://get.videolan.org/vlc/2.2.1/macosx/vlc-2.2.1.dmg",
  }

  package { [
    'scala-ide',
    'torbrowser',
    ]:
    ensure   => present,
    provider => 'brewcask',
    require  => Package['brew-cask'],
  }

  class { 'nodejs::global': version => $node_version }

  nodejs::version { '0.12.0': }

#  npm_module { [
#    'express-generator',
#    'jsontool',
#    'grunt-cli',
#    'gulp',
#    'keybase-installer',
#    'node-inspector',
#    'stackvis',
#    'tick',
#    ]:
#    node_version => $node_version,
#  }

  $home = "/Users/${::luser}"
  $home_projects = "${home}/Projects"

  file { $home_projects:
    ensure => directory,
  }

  file { "${::luser}-fabricrc":
    path    => "$home/.fabricrc",
    ensure  => 'file',
    content => 'user = jabley',
  }

  $dotfiles = "${home_projects}/homedir"

  repository { $dotfiles:
    source  => 'jabley/homedir',
    require => File[$home_projects],
    notify  => Exec['jabley-make-homedir'],
  }

  exec { 'jabley-make-homedir':
    command     => "cd ${dotfiles} && make",
    refreshonly => true,
  }

  include people::jabley::repos

#  $emacs = "${home_projects}/emacs-d"
#
#  repository { $emacs:
#    source  => 'jabley/emacs-d',
#    require => File[$home_projects],
#    notify  => Exec['jabley-make-emacs-d'],
#  }
#
#  exec { 'jabley-make-emacs-d':
#    command     => "cd ${emacs} && make",
#    refreshonly => true,
#  }

  exec { 'install_go_tools':
    environment => ["GOPATH=${home}/gocode"],
    command => 'go get -u golang.org/x/tools/cmd/cover \
                && go get -u golang.org/x/tools/cmd/godoc \
                && go get -u golang.org/x/tools/cmd/present \
                && go get -u golang.org/x/tools/cmd/vet \
                && go get -u golang.org/x/tools/cmd/goimports \
                && go get -u code.google.com/p/go.blog/blog \
                && go get -u github.com/jabley/train/cmd/train \
                && go get -u github.com/alphagov/gds-present \
                && go get -u github.com/golang/lint/golint \
                '
  }

  # Settings from puppet-osx
  include osx::disable_app_quarantine
  include osx::dock::2d
  include osx::dock::autohide
  class { 'osx::dock::position':
    position => 'left'
    }
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
