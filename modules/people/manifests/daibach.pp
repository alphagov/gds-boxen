class people::daibach {

  include alfred
  include caffeine
  include chrome
  include dropbox
  include gds_osx::remove_spotlight
  include gds_osx::turn_off_dashboard
  include gitx::dev
  include iterm2::stable
  include java
  include mysql
  include onepassword
  include openconnect
  include propane
  include spotify
  include sublime_text_2
  include textmate
  include vagrant
  vagrant::plugin { 'vagrant-dns': }
  include gds_virtualbox
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
