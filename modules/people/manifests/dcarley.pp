class people::dcarley {
  include adium
  include caffeine
  include chrome
  include gds-resolver
  include git
  include iterm2::stable
  include turn-off-dashboard
  include vagrant
  include vim
  include virtualbox
  include wget

  include zsh
  include ohmyzsh

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-zz-multiprovider-snap': }

  dock::size { 40: }

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment
  include projects::deployment::creds

  # These are all Homebrew packages
  package {
    [
      'apg',
      'bash-completion',
      'gnu-sed',
      'go',
      'tmux'
    ]:
    ensure => present,
  }

  package { 'lice':
    ensure   => present,
    provider => 'pip',
  }

  $home = "/Users/${::luser}"
  $projects = "${home}/projects"
  $projects_personal = "${projects}/personal"

  file { [$projects, $projects_personal]:
    ensure  => directory,
  }

  include people::dcarley::dotfiles

  # Dependency for puppet-vim
  file { "${home}/.vimrc":
    ensure  => link,
    target  => "dotfiles/.vimrc",
    require => Class['people::dcarley::dotfiles'],
  }

  vim::bundle { 'rodjek/vim-puppet': }
  vim::bundle { 'godlygeek/tabular': }
}
