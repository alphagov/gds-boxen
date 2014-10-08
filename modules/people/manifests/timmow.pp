class people::timmow {
  include dropbox
  include iterm2::stable
  include macvim
  include zsh
  include slate
  include projects::deployment::creds

  package {
    [
      'tree',
      'ag',
      'fasd',
      'python',
      'ssh-copy-id',
      'npm',
      'tmux',
      'reattach-to-user-namespace',
      'bash-completion',
      'pyenv',
      'gpg',
    ]:
    ensure => present,
  }

  class { 'gds_ssh_config': }
  ssh_config::fragment{'performance-platform':
    content => template('teams/performance-platform/ssh-config'),
  }
  ssh_config::fragment {"user":
    content => template('people/timmow/ssh_config'),
  }
  homebrew::tap { 'caskroom/cask': }
  include vagrant
  vagrant::plugin { 'cachier': }
  vagrant::plugin { 'dns': }
  vagrant::plugin { 'vmware-fusion': }
  vagrant::plugin { 'multiprovider-snap': }
  vagrant::plugin { ['vagrant-global-status','vagrant-vbguest']:
    ensure => absent,
  }
  include vagrant_manager
  include virtualbox
  include vmware_fusion
}
