class people::timmow {
  include dropbox
  include iterm2::stable
  include macvim
  include zsh
  include slate
  include projects::deployment::creds
  include teams::performance-platform
  include teams::infrastructure
  class { 'nodejs::global': version => 'v0.10.31' }
  npm_module {
    [
      'grunt-cli',
      'gulp',
      'jshint',
    ]:
    node_version => 'v0.10.31'
  }

  package {
    [
      'tree',
      'ag',
      'fasd',
      'python',
      'tmux',
      'reattach-to-user-namespace',
      'bash-completion',
      'pyenv',
      'gpg',
      'gpg-agent',
      'ansible',
      'hg',
      'gnu-sed',
      'leiningen',
      'postgres',
      'tig',
      'jq',
      'brew-cask',
      'graphviz',
      'siege',
      'ipcalc',
      'percona-toolkit',
      'cairo',
      'netcat',
      'nmap',
      'openconnect',
      'gcal',
      'golang',
      'npm',
      'coreutils',
    ]:
    ensure => present,
  }

  package {
    [
      'alfred',
      'gephi',
      'flux',
      'limechat',
    ]:
    ensure   => present,
    provider => 'brewcask',
    require  => Package['brew-cask'],
  }

  package {
    [
      'virtualenv',
      'virtualenvwrapper',
    ]:
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }

  class { 'gds_ssh_config': }
  ssh_config::fragment {"user":
    content => template('people/timmow/ssh_config'),
  }
  homebrew::tap { 'caskroom/cask': }
  class { 'vagrant':
      version => '1.8.1'
  }
  vagrant::plugin { 'cachier': }
  vagrant::plugin { 'dns': }
  vagrant::plugin { 'vmware-fusion': }
  vagrant::plugin { 'multiprovider-snap': }
  vagrant::plugin { ['vagrant-global-status','vagrant-vbguest']:
    ensure => absent,
  }
  include virtualbox
  include vmware_fusion
  include sourcecodepro
  class { 'osx::sound::interface_sound_effects':
      enable => false
  }
  include osx::global::enable_keyboard_control_access
  osx_login_item { 'Slate':
     name    => 'Slate',
     path    => '/Applications/Slate.app',
     hidden  => true,
     require => Class['Slate'],
  }
  include projects::blinken
  include projects::blinken-config
  include karabiner

  # launch and add login-item
  include karabiner::login_item
  class {'modern_space_cadet':
    shifts_to_parens     => false,
    force_correct_shifts => false,
    fix_opt_arrows       => false,
  }
  karabiner::set{ 'repeat.initial_wait':
    value => '200'
  }
  karabiner::set{ 'repeat.wait':
    value => '20'
  }
  ruby::version { '1.9.3-p484': }

  sudo::alias{'VAGRANT_EXPORTS_ADD':
    ensure     => present,
    sudo_alias => 'Cmnd_Alias',
    items      => '/usr/bin/tee -a /etc/exports'
  }
  sudo::alias{'VAGRANT_NFSD':
    ensure     => present,
    sudo_alias => 'Cmnd_Alias',
    items      => '/sbin/nfsd restart'
  }
  sudo::alias{'VAGRANT_EXPORTS_REMOVE':
    ensure     => present,
    sudo_alias => 'Cmnd_Alias',
    items      => '/usr/bin/sed -E -e /*/ d -ibak /etc/exports'
  }
  sudo::spec { 'vagrant':
    users    => $::boxen_user,
    hosts    => 'ALL',
    commands => '(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE',
  }

}
