class people::dcarley {
  include adium
  include caffeine
  include chrome
  include gds_osx::turn_off_dashboard
  include gds_resolver
  include gds_vpn_profiles
  include git
  include iterm2::stable
  include vagrant
  include vim
  include gds_virtualbox
  include wget

  include zsh
  include ohmyzsh

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-zz-multiprovider-snap': }

  class { 'osx::dock::icon_size': size => 40 }

  # Projects accessible to everyone in Infrastructure
  class { 'teams::infrastructure': manage_gitconfig => false }
  include gds_ssh_config
  include projects::router

  # Projects only accessible to certain staff
  include projects::deployment
  include projects::deployment::creds

  # Other projects
  include teams::performance-platform
  include teams::performance-platform::ssh

  # These are all Homebrew packages
  package {
    [
      'apg',
      'bash-completion',
      'graphviz',
      'gnu-sed',
      'tmux'
    ]:
    ensure => present,
  }

  package { 'go':
    ensure          => present,
    install_options => '--cross-compile-common',
  }

  package { 'lice':
    ensure   => present,
    provider => 'pip',
  }

  $home              = "/Users/${::luser}"
  $projects          = "${home}/projects"
  $projects_personal = "${projects}/personal"
  $dotfiles          = "/Users/${::luser}/dotfiles"

  file { [$projects, $projects_personal]:
    ensure  => directory,
  }

  repository { $dotfiles:
    source  => 'dcarley/dotfiles',
    notify  => Exec['install dotfiles'],
  }

  exec { 'install dotfiles':
    command     => 'rake',
    cwd         => $dotfiles,
    logoutput   => true,
    refreshonly => true,
  }

  # Dependency for puppet-vim
  file { "${home}/.vimrc":
    ensure  => link,
    target  => "dotfiles/.vimrc",
    require => Exec['install dotfiles'],
  }

  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'godlygeek/tabular': }
  vim::bundle { 'jnwhiteh/vim-golang': }
}
