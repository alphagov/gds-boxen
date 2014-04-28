class people::samjsharpe::packages {

  include alfred
  include chrome
  include dropbox
  include firefox
  include gds_resolver
  include gds_vpn_profiles
  include googledrive
  include gnupg
  include hub
  include iterm2::stable
  include libreoffice
  include libreoffice::languagepack
  include macvim
  include mou
  include mou::themes
  include mplayerx
  include openconnect
  include screen
  include skype
  include spectacle
  include spf13vim3
  include stay
  include vagrant
  vagrant::plugin { 'vagrant-cachier': }
  vagrant::plugin { 'vagrant-dns': }
  vagrant::plugin { 'vagrant-global-status': }
  vagrant::plugin { 'vagrant-vbguest': }
  vagrant::plugin { 'vagrant-vmware-fusion': }
  include virtualbox
  include vmware_fusion

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

  # Clobber boxen version of Git to use stock homebrew
  Package <| title == "boxen/brews/git" |> {
    ensure => "1.9.2"
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
      'parallel',
      'python',
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
  package {'virtualenvwrapper':
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }

  $ohmyzshdir = "/Users/${::luser}/.oh-my-zsh"
  $ohmyzshcustom = "${ohmyzshdir}/custom/plugins/"

  file {[$ohmyzshcustom,"${ohmyzshcustom}/virtualenvwrapper"]:
    ensure => directory,
    notify => File["${ohmyzshcustom}/virtualenvwrapper/virtualenvwrapper.plugin.zsh"],
  }
  file {"${ohmyzshcustom}/virtualenvwrapper/virtualenvwrapper.plugin.zsh":
    ensure  => present,
    source  => 'puppet:///modules/people/samjsharpe/virtualenvwrapper.plugin.zsh',
    require => Class['ohmyzsh'],
  }

}
