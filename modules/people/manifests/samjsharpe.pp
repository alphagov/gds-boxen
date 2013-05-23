class people::samjsharpe {
  include adium
  include alfred::two
  include chicken
  include chrome
  include cord
  include dropbox
  include firefox
  include gds-resolver
  include git-pulls
  include git-remote-branch
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

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment
  include projects::deployment::creds
  include teams::performance-platform::puppet

  repository { "${boxen::config::srcdir}/ubuntu-1204-dev":
    source  => 'alphagov/ubuntu-1204-dev',
  }

  repository { "${boxen::config::srcdir}/dotfiles":
    source  => 'samjsharpe/dotfiles',
    notify  => Exec['samjsharpe-link-my-dotfiles'],
  }

  exec {'samjsharpe-link-my-dotfiles':
    command     => "${boxen::config::srcdir}/dotfiles/link.sh",
    refreshonly => true,
  }

  file {"/Users/${::luser}/.oh-my-zsh/custom/samsharpe.zsh-theme":
    content => 'ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:%{$fg[green]%}"
PROMPT=\'$(virtualenv_prompt_info)%{$reset_color%}[%{$fg[cyan]%}%2d$(git_prompt_info)%{$reset_color%}]$ \'
',
    require => Class['ohmyzsh']
  }

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
