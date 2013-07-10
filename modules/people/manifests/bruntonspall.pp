class people::bruntonspall {
  include alfred::two
  include antirsi
  include caffeine
  include chrome
  include dropbox
  include encfs
  include gds-resolver
  include java
  include intellij
  include git
  include gnupg
  include gitx::dev
  include sublime_text_2
  include turn-off-dashboard
  include vagrant
  include virtualbox
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
  #include colloquy
  #include fitbit
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
  #include teams::infrastructure

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
