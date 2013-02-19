class people::samjsharpe {
  include adium
  include alfred
  include chicken
  include chrome
  include dropbox
  include firefox
  include git-pulls
  include git-remote-branch
  include googledrive
  include iterm2::stable
  include macvim
  include mailplane::beta
  include mplayerx
  include oh-my-zsh
  include onepassword
  include screen
  include skype
  include slate
  include spf13-vim-3
  include turn-off-dashboard
  include theunarchiver
  include vagrant
  include vagrant-dns
  include virtualbox
  include zsh

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment

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
      'autoconf', 'autojump', 'automake', 'bdw-gc', 'boost', 'brew-pip',
      'cabextract', 'coreutils', 'ctags', 'encfs', 'fdupes', 'fuse4x',
      'fuse4x-kext', 'gdbm', 'gettext', 'git', 'git-extras', 'git-flow',
      'gnupg', 'go', 'jasper', 'jpeg', 'legit', 'libicns',
      'libpng', 'libpst', 'libtool', 'libyaml', 'nmap', 'ntfs-3g', 'openssl',
      'parallel', 'pcre', 'pkg-config', 'rdesktop', 'readline', 'rename',
      'renameutils', 'rlog', 's3cmd', 'sslscan', 'unrar', 'w3m', 'wget', 'xz',
      'youtube-dl', 'zsh-completions', 'zsh-lovers'
    ]:
    ensure => present,
  }
}
