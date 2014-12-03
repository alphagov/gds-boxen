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
  nodejs::module {
    ['grunt-cli']:
    node_version => 'v0.10.31'
  }

  package {
    [
      'tree',
      'ag',
      'fasd',
      'python',
      'ssh-copy-id',
      'tmux',
      'reattach-to-user-namespace',
      'bash-completion',
      'pyenv',
      'gpg',
      'ansible',
      'hg',
      'gnu-sed',
    ]:
    ensure => present,
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
  ssh_config::fragment{'performance-platform':
    content => template('teams/performance-platform/ssh-config'),
  }
  ssh_config::fragment {"user":
    content => template('people/timmow/ssh_config'),
  }
  homebrew::tap { 'caskroom/cask': }
  class { 'vagrant':
      version => '1.6.5'
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
}
