class people::benilovj {
  ## Remove the # from any of the below to install that software
  include virtualbox::latest

  class { 'intellij':
      edition => 'community',
  }
  #include nvm
  #include alfred
  #include caffeine
  #include chrome
  #include clojure
  #include colloquy
  #include dropbox
  #include fitbit
  #include gitx
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
  #include sublime_text_2
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
  package {
    [
  #    'autoconf',
  #    'autojump',
  #    'automake',
      'gradle',
    ]:
    ensure => present,
  }
}
