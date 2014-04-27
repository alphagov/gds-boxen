class people::ajlanghorn {
  include adium
  include caffeine
  include chrome
  include encfs
  include gds_resolver
  include gds_vpn_profiles
  include git
  include iterm2::stable
  include gds_osx::turn_off_dashboard
  include vagrant
  include vim
  include gds_virtualbox
  include wget

# zsh is the shell
# ohmyzsh is extensions for zsh
  include zsh
  include ohmyzsh

  vagrant::plugin { 'vagrant-cachier': }
  # https://github.com/fgrehm/vagrant-cachier
  vagrant::plugin { 'vagrant-zz-multiprovider-snap': }
  # https://github.com/scalefactory/vagrant-multiprovider-snap

  # =================================================
  #
  # Dependency for puppet-vim

  $dotfiles           = "${home}/dotfiles"

  file { "$home/.vimrc":
    ensure  => link,
    target  => "dotfiles/.vimrc",
    require => Exec['install dotfiles'],
    }

  vim::bundle { 'rodjek/vim-puppet': }

  include projects::deployment
  include projects::deployment::creds

  # These are all Homebrew packages
  package {
    [
      'autojump',
      'automake',
      'bash-completion',
      'git',
      'gnu-sed',
      'graphviz',
      'openssl',
      'swaks',
      'tmux',
    ]:
    ensure => present,
  }

  $home               = "/Users/${::luser}"
  $projects           = "${home}/projects"
  $projects_personal  = "${home}/personal"

  file { [$projects, $projects_personal]:
    ensure => directory,
  }

  exec { 'install dotfiles':
    command     => 'rake',
    cwd         => $dotfiles,
    logoutput   => true,
    refreshonly => true,
  }

}
