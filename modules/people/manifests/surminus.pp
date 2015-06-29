## Paul Martin boxen config ^_^ 
class people::surminus {
  include alfred
  include caffeine
  include chrome
  include firefox
  include gds_resolver
  include gds_vpn_profiles
  include git
  include googledrive 
  include hub
  include iterm2::stable
  #include openconnect # doesn't play ball with Yosemite
  include screen
  include spotify
  include vagrant
  include virtualbox
  include zsh
  include ohmyzsh

  ## osx stuff 

  osx::recovery_message { 'If this Mac is found, please call 07780 225 281': } 

  ## dotfiles
  repository { "${boxen::config::srcdir}/dotfiles":
    source  => 'surminus/dotfiles',
  }

  ## projects
  # include projects::all

  class { 'gds_printers':
    ldap_username => 'paulmartin',
  }

  ## homebrew
  package {
    [
      'autoconf',
      'autojump',
      'automake',
      'bash-completion',
      'cmake',
      'coreutils',
      'docker',
      'gnupg',
      'go',
      'htop-osx',
      'libxml2',
      'packer',
      'wget',
    ]:
    ensure => present,
  }
}
