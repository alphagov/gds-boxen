## Paul Martin boxen config :3
class people::surminus {
  include alfred
  include caffeine
  include chrome
  include firefox
  include gds_resolver
  include gds_vpn_profiles
  include git
  include gitx
  include googledrive
  include hub
  include iterm2::stable
  include iterm2::colors::solarized_dark
  include macvim
  include ohmyzsh
  include projects::deployment::creds
  include screen
  include spotify
  include vagrant
  include virtualbox
  include zsh

  ## osx stuff

  osx::recovery_message { 'If this Mac is found, please call 07870 300 659': }

  $home    = "/Users/${::luser}"
  $mystuff = "${home}/surminus"

  ## dotfiles
  repository { "${mystuff}/dotfiles":
    source  => 'surminus/dotfiles',
  }

  # junk scripts
  repository { "${mystuff}/scripts":
    source => 'surminus/scripts',
  }

  $vimrc = "${mystuff}/dotfiles/vimrc"
  $zshrc = "${mystuff}/dotfiles/zshrc"

  file { "${home}/.vimrc":
    ensure => 'link',
    target => "${mystuff}/dotfiles/vimrc",
  }

  file { "${home}/.zshrc":
    ensure => 'link',
    target => "${mystuff}/dotfiles/zshrc",
  }

  file { "${home}/Scripts/keepass-merge":
    ensure => absent,
  }

  file { [ "${mystuff}", "${home}/.vim", "${home}/.vim/bundle", "${home}/.vim/autoload"]:
    ensure => directory,
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
      'go',
      'htop-osx',
      'libxml2',
      'packer',
      'pass',
      'wget',
    ]:
    ensure => present,
  }

package {
    [
      'osxfuse',
      'xscreensaver',
    ]:
    ensure   => present,
    provider => 'brewcask',
  }
}
