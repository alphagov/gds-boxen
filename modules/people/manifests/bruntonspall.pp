class people::bruntonspall {
# System stuff
  include gds_osx::turn_off_dashboard
  include gds_osx::remove_spotlight
  include gds_resolver
  include gds_development
  include gds_vpn_profiles
  include gds_resolver
  include gds_virtualbox
  include openconnect

# Terminal apps
  include iterm2::dev
  include git
  include gitx::dev
  include vagrant
  include java
  include wget

# Apps I use
  include alfred
  include antirsi
  include atom
  include caffeine
  include chrome
  include dropbox
  include googledrive
  include skype
  include notational_velocity::nvalt


# Projects
  include projects::development
  include projects::frontend
  include projects::router
  include projects::frontend
  include projects::govuk_frontend_toolkit
  include projects::private-utils
  include projects::transition-config
  include projects::router
  include projects::rummager
  include projects::smokey
  include projects::static
  include projects::whitehall

  repo::alphagov { 'design-patterns': }
  repo::alphagov { 'government-service-design-manual': }
  repo::alphagov { 'service-domain-checker': }
  repo::alphagov { 'servicechecker': }
  repo::alphagov { 'transformation-dashboard': }

  class { 'intellij':
      edition => 'ultimate'
  }

  $work = "${home}/work"
  $projects = "${home}/projects"

  file { [$projects, $work]:
    ensure  => directory,
  }

  $dotfiles = "${projects}/home"

  repository { $dotfiles:
    source  => 'bruntonspall/home',
    require => File[$projects],
  #  notify  => Exec['install-dotfiles'],
  }

  #exec { 'install-dotfiles':
  #  cwd         => $dotfiles,
  #  command     => "install.sh",
  #  refreshonly => true,
  #}

  git::config::global { 'user.email':
    value  => 'michael@brunton-spall.co.uk'
  }

  git::config::global { 'user.name':
    value  => 'Michael Brunton-Spall'
  }

  Boxen::Osx_defaults {
    user => $::luser,
  }

# Configure some osx settings
  include osx::no_network_dsstores
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::dock::autohide



# Tools needed for my mutt/offlineimap mail setup
  package {
    [
      'offline-imap',
      'mutt',
      'urlview',
      'links'
    ]:
    ensure => present,
  }

# Other brew packages
  package {
    [
      'htop-osx',
      'ssh-copy-id',
      'bash-completion',
      'scala',
      'sbt',
      'giter8',
      'go',
      'python',
      'vim',
      'bash-completion2',
      'npm'
    ]:
    ensure => present,
  }


  ## Remove the # from any of the below to install that software
  #include nvm
  #include clojure
  #include hub
  #include iterm2
  #include macvim
  #include mysql
  #include onepassword
  #include osx
  #include qt
  #include screen
  #include skype
  #include sparrow
  #include spotify
  #include textmate
  #include things
  #include wget
  #include xquartz
  #include zsh)

  ## See modules/teams/manifests for things you can include here
  #class { 'teams::infrastructure': manage_gitconfig => false }

  ## You can also include particular projects from modules/projects/manifests
  #include projects::deployment

  ## Here's how to include a personal github project
  #repository { "${boxen::config::srcdir}/dotfiles":
  #  source  => 'yourusername/dotfiles',
  #}

  ## This is how to install Homebrew packages
  ## You can get a list of your current packages with
  ## `brew list`
  #package {
  #  [
  #    'autoconf',
  #    'autojump',
  #    'automake',
  #  ]:
  #  ensure => present,
  #}
}
