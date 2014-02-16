class people::benilovj {
  ## Remove the # from any of the below to install that software
  include gds_virtualbox::42_latest

  class { 'intellij':
      edition => 'community',
  }
  include alfred
  include chrome
  include dropbox
  include libreoffice
  include spotify
  include sublime_text_2
  include wget
  #include iterm2
  #include onepassword
  #include osx
  #include qt
  #include skype
  #include xquartz

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
