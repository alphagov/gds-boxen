class people::rjw1 {
  include chrome
  include firefox
  include encfs
  include gds_vpn_profiles
  include openconnect
  include git
  include gnupg
  include iterm2::stable
  include vagrant
  include gds_virtualbox

  class { 'teams::infrastructure': manage_gitconfig => false }

  include projects::deployment::creds
  include projects::blinken
  include projects::blinken-config



  repository { "/Users/bobwalker/git/dotfiles":
    source  => 'git@github.com:rjw1/dotfiles.git',
  }

  repository { "/Users/bobwalker/git/OpenGuides":
    source  => 'git@github.com:OpenGuides/OpenGuides.git',
  }

  boxen::osx_defaults { "Disable 'natural scrolling'":
    key    => 'com.apple.swipescrolldirection',
    domain => 'NSGlobalDomain',
    value  => 'false',
    type   => 'bool',
  }

  boxen::osx_defaults { 'Do not create .DS_Store':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.dashboard',
    value  => 'true',
  }

package {
    [
      'python',
      'tmux',
      'bash-completion',
      'leiningen',
      'vim',
    ]:
    ensure => present,
  }
  # Python packages
  package {
    [
      'Sphinx',
    ]:
    ensure => present,
    provider => pip,
  }
  # Perl
  class { 'perl::global':
      version => '5.18.2'
  }
  perl::version { '5.18.2': }

  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'godlygeek/tabular': }
}

