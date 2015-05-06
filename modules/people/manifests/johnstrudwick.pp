class people::johnstrudwick {
  include gds_resolver
  include gds_development
  include gds_vpn_profiles
  include gds_virtualbox

  include iterm2::stable
  include git
  include gitx::dev
  include java
  include vagrant
  include wget

  include chrome
  include evernote
  include firefox
  include googledrive
  include sublime_text_2

  include osx::finder::empty_trash_securely

  package {
    [
      'bash-completion',
    ]:
    ensure => present,
  }

  class { 'gds_printers':
    ldap_username => 'johnstrudwick'
  }
}
