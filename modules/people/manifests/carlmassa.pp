class people::carlmassa {
  include chrome
  include dropbox
  include firefox
  include gds_resolver
  include github_for_mac
  include gitx::dev
  include gnupg
  include googledrive
  include hub
  include iterm2::stable
  include mou
  include mplayerx
  include openconnect
  include screen
  include unarchiver
  include vagrant
  vagrant::plugin { 'vagrant-dns': }
  vagrant::plugin { 'vagrant-vbguest': }
  include gds_virtualbox::42_latest

  # Projects accessible to everyone in Infrastructure
  class { 'teams::infrastructure': manage_gitconfig => false }
  # Projects only accessible to certain staff
  include projects::deployment
  include projects::deployment::creds

  file {"${boxen::config::srcdir}/development/Vagrantfile.local":
    content => "
        config.vm.network :hostonly, '10.23.45.67'
        config.vm.customize ['modifyvm', :id, '--memory', 1024]
        config.vm.customize ['modifyvm', :id, '--cpus', 2]
        config.vm.customize ['modifyvm', :id, '--name', 'lucid_dev_vm']
",
    require => Class['Projects::Development']
  }

  # These are all Homebrew packages
  package {
    [
      'brew-pip',
      'brew-gem',
      'htop-osx',
      'nmap',
      'ntfs-3g',
      'parallel',
      's3cmd',
      'ssh-copy-id',
      'unrar',
      'wget',
    ]:
    ensure => present,
  }

  # Settings from puppet-osx
  include osx::disable_app_quarantine
  include osx::dock::2d
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores
  osx::recovery_message { 'If found, please call +44 (0) 7447 907 231': }

}
