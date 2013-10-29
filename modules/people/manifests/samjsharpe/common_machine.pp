class people::samjsharpe::common_machine {

  include adium
  include alfred::two
  include controlplane
  include dropbox
  include firefox
  include gds_vpn_profiles
  include googledrive
  include hub
  include iterm2::stable
  include macvim
  include mou
  include mou::themes
  include mplayerx
  include ohmyzsh
  include openconnect
  include packer
  include screen
  include spectacle
  include spf13vim3
  include sublime_text_2
  include stay
  include turn-off-dashboard
  include unarchiver
  include vagrant
  include vmware_fusion
  include zsh

  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-vmware-fusion': }

  file {"/Users/${::luser}/.oh-my-zsh/custom/samsharpe.zsh-theme":
    content => 'ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:%{$fg[green]%}"
PROMPT=\'$(virtualenv_prompt_info)%{$reset_color%}[%{$fg[cyan]%}%2d$(git_prompt_info)%{$reset_color%}]$ \'
',
    require => Class['ohmyzsh']
  }

  # These are all Homebrew packages
  package {
    [
      'autojump',
      'brew-pip',
      'brew-gem',
      'colordiff',
      'ctags',
      'fping',
      'heroku-toolbelt',
      'htop-osx',
      'nmap',
      'ntfs-3g',
      'osxutils',
      'parallel',
      'rbenv-bundler',
      's3cmd',
      'ssh-copy-id',
      'sslscan',
      'tmux',
      'unrar',
      'wget',
      'zsh-completions',
    ]:
    ensure => present,
  }

  Boxen::Osx_defaults {
    user => $::luser,
  }

  # Settings from puppet-osx
  include osx::disable_app_quarantine
  include osx::dock::2d
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores

  boxen::osx_defaults { 'Put my Dock on the left':
    key    => 'orientation',
    domain => 'com.apple.dock',
    value  => 'left',
  }

  boxen::osx_defaults { 'Disable reopen windows when logging back in':
    key    => 'TALLogoutSavesState',
    domain => 'com.apple.loginwindow',
    value  => 'false',
  }

  exec { 'Disable Gatekeeper':
    command => 'spctl --master-disable',
    unless  => 'spctl --status | grep disabled',
  }
}
