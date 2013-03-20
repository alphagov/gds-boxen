class people::samjsharpe {
  include adium
  include alfred::two
  include calibre
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
  include jumpcut
  include macvim
  include mou
  include mplayerx
  include notational_velocity::nvalt
  include oh-my-zsh
  include onepassword
  include openconnect
  include screen
  include slate
  include sourcetree
  include spf13-vim-3
  include transmission
  include turn-off-dashboard
  include theunarchiver
  include vagrant
  include vagrant-dns
  include vagrant-vbguest
  include virtualbox::latest
  include zsh

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment
  include projects::deployment::creds

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
PROMPT=\'[%{$fg[cyan]%}%2d$(git_prompt_info)%{$reset_color%}]$ \'
',
    require => Class['oh-my-zsh']
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
      's3cmd',
      'ssh-copy-id',
      'sslscan',
      'unrar',
      'wget',
      'zsh-completions',
      'zsh-lovers'
    ]:
    ensure => present,
  }
}
