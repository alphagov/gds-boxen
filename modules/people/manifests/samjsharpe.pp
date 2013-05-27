class people::samjsharpe {

  $home              = "/Users/${::luser}"
  $home_projects     = "${home}/Projects"
  $govuk_projects    = "${home_projects}/govuk"
  $gds_projects      = "${home_projects}/gds"
  $personal_projects = "${home_projects}/personal"

  if $::hostname != 'Sams-MacBook-Air' {
    class { 'people::samjsharpe::gds_repos':
      project_home => $gds_projects,
    }
    class { 'people::samjsharpe::govuk_repos':
      project_home => $govuk_projects,
    }
    class { 'people::samjsharpe::personal_repos':
      project_home => $personal_projects,
    }
  } else {
    class { 'people::samjsharpe::personal_repos':
      project_home => $personal_projects,
    }
  }

  include adium
  include alfred::two
  include chicken
  include chrome
  include dropbox
  include encfs
  include firefox
  include gds-resolver
  include gnupg
  include googledrive
  include hub
  include iterm2::stable
  include macvim
  include mou
  include mplayerx
  include ohmyzsh
  include openconnect
  include screen
  include slate
  include spf13vim3
  include turn-off-dashboard
  include unarchiver
  include vagrant_gem
  include vagrant-dns
  include vagrant-vbguest
  include virtualbox::latest
  include zsh

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
  include osx::finder::empty_trash_securely
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::no_network_dsstores
  osx::recovery_message { 'If found, please call +44 (0) 7788 947 401': }

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
