class people::daibach {
# System stuff
  include gds_osx::turn_off_dashboard
  include gds_osx::remove_spotlight
  include gds_resolver
  include gds_development
  include gds_vpn_profiles
  include gds_virtualbox

# Terminal apps
  include iterm2::stable
  include git
  include gitx::dev
  include vagrant
  include mysql
  include wget

# Apps I use
  include alfred
  include atom
  include caffeine
  include chrome
  include dropbox
  include evernote
  include firefox
  include googledrive
  include onepassword
  include spotify
  include sublime_text_2
  include textmate

# OSX settings
  include osx::no_network_dsstores
  include osx::global::tap_to_click
  include osx::dock::autohide
  include osx::finder::empty_trash_securely
#  include osx::finder::show_all_filename_extensions

  include teams::mainstream

  package {
    [
      'bash-completion',
      'mongodb',
      'rabbitmq',
    ]:
    ensure => present,
  }

}
