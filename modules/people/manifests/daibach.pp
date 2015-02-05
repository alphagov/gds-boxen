class people::daibach {
# System stuff
  include gds_osx::turn_off_dashboard
  include gds_osx::remove_spotlight
  include gds_virtualbox
  include openconnect

# Terminal apps
  include iterm2::stable
  include git
  include gitx::dev
  include vagrant
  include java
  include mysql
  include wget

# Apps I use
  include alfred
  include caffeine
  include chrome
  include dropbox
  include onepassword
  include spotify
  include sublime_text_2
  include textmate

  include teams::mainstream

  package {
    [
      'mongodb',
      'rabbitmq',
    ]:
    ensure => present,
  }

}
