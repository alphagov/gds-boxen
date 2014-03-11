class people::rboulton {
  # This gives you the tools and repos to make a development VM
  include gds_development
  include gds_vpn_profiles

  ## Remove the # from any of the below to install that software
  #include nvm
  #include alfred
  #include caffeine
  include chrome
  #include clojure
  #include dropbox
  include gitx
  #include hub
  #include iterm2
  include macvim
  #include mysql
  #include onepassword
  #include osx
  #include qt
  include screen
  #include skype
  #include sparrow
  #include spotify
  #include sublime_text_2
  #include textmate
  #include things
  include wget
  #include xquartz
  #include zsh)
  include vagrant
  vagrant::plugin { 'vagrant-dns': }
  include gds_virtualbox

  ## See modules/teams/manifests for things you can include here
  include teams::mainstream
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
