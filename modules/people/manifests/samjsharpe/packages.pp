class people::samjsharpe::packages {

  include alfred::two
  include chicken
  include chrome
  include dropbox
  include firefox
  include gds_vpn_profiles
  include gds-resolver
  include googledrive
  include gnupg
  include hub
  include iterm2::stable
  include macvim
  include mou
  include mou::themes
  include mplayerx
  include openconnect
  include packer
  include screen
  include spectacle
  include spf13vim3
  include stay
  include sublime_text_2
  include turn-off-dashboard
  include unarchiver
  include vagrant
  vagrant::plugin { 'vagrant-vmware-fusion': }
  vagrant::plugin { 'vagrant-global-status': }
  include virtualbox

  # ZSH stuff
  include zsh
  include ohmyzsh
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
      'colordiff',
      'ctags',
      'dtrx',
      'fping',
      'gpg-agent',
      'heroku-toolbelt',
      'htop-osx',
      'nmap',
      'ntfs-3g',
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

}
