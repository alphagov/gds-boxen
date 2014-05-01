class people::kushalp {
  include caffeine
  include chrome
  include dropbox
  include emacs::formacosx
  include flux
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_virtualbox
  include gds_vpn_profiles
  include iterm2::stable
  include java
  include ohmyzsh
  include openconnect
  include slate
  include vmware_fusion
  include wget
  include zsh

  # Settings from puppet-osx.
  include osx::dock::autohide
  include osx::dock::dim_hidden_apps
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores

  class { 'gds_development': version => '1.5.1' }

  osx::recovery_message { 'If found, please call +44 7788 948 158': }

  vagrant::plugin { ['vagrant-vmware-fusion', 'vagrant-cachier']: }

  $home = "/Users/${::luser}"
  repository { "${home}/.emacs.d":
    source => 'git@github.com:kushalp/emacs-starter-kit.git',
  }

  class security inherits boxen::security {
    Boxen::Osx_defaults['short delay for password dialog on screensaver'] {
      value  => 0,
    }
  }

  include security
}
