class people::bruntonspall {
  include alfred
  include antirsi
  include caffeine
  include chrome
  include dropbox
  include encfs
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include java
  include intellij
  include iterm2::dev
  include git
  include gnupg
  include gitx::dev
  include sublime_text_2
  include vagrant
  include gds_virtualbox
  include wget


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

  include osx::no_network_dsstores
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::dock::autohide



  package {
    [
      'offline-imap',
      'app-engine-java-sdk',
      'mutt',
      'urlview',
      'links',
      'htop-osx',
      'ssh-copy-id',
      'bash-completion'
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
