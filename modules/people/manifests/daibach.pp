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
  include omnigraffle::pro
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

  $home = "/Users/${::luser}"
  $projects = "${home}/projects"

  file { $projects:
    ensure  => directory,
  }

  $dotfiles = "${projects}/dotfiles"

  repository { $dotfiles:
    source  => 'daibach/dotfiles',
    require => File[$projects],
    notify  => Exec['make-dotfiles'],
  }

  exec { 'make-dotfiles':
    cwd         => $dotfiles,
    command     => "make",
    refreshonly => true,
  }

  package {
    [
      'bash-completion',
      'mongodb',
      'rabbitmq',
    ]:
    ensure => present,
  }

  class { 'gds_printers':
    ldap_username => 'daivaughan',
  }

}
