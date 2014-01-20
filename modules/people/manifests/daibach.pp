class people::daibach {

  include alfred
  include caffeine
  include chrome
  include dropbox
  include gitx::dev
  include iterm2::stable
  include java
  include mysql
  include onepassword
  include openconnect
  include propane
  include remove-spotlight
  include spotify
  include sublime_text_2
  include textmate
  include turn-off-dashboard
  include vagrant_gem
  include vagrant-dns
  include virtualbox
  include wget

  include teams::mainstream

  package {
    [
      'mongodb',
      'rabbitmq',
    ]:
    ensure => present,
  }

}
