class people::issyl0 {
  include gds_development
  include gds_resolver
  include gds_ssh_config
  include gds_osx::turn_off_dashboard
  include chrome
  include spotify
  include atom
  include wget
  include dropbox
  include onepassword
  include caffeine

  # I couldn't make vagrant or VirtualBox install cleanly on 10.11, so
  # I'm installing them outside of Boxen.
}
