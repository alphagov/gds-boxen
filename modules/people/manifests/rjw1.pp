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
  include virtualbox

  include teams::infrastructure

  include projects::deployment::creds



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
      'vim',
    ]:
    ensure => present,
  }

  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'godlygeek/tabular': }
}

