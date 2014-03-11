# Change "copy_me_to_your_github_username" to your actual github username
class people::copy_me_to_your_github_username {
  # This gives you the tools and repos to make a development VM
  include gds_development
  ## Remove the # from any of the below to install that software
  #include nvm
  #include alfred
  #include caffeine
  #include chrome
  #include clojure
  #include dropbox
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
  #include sublime_text_3
  #include textmate
  #include things
  #include wget
  #include xquartz
  #include zsh)

  ## See modules/teams/manifests for things you can include here
  #  class { 'teams::infrastructure': manage_gitconfig => false }

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
