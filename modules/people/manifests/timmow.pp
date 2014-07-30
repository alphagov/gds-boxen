class people::timmow {
  include gds_development
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
}
