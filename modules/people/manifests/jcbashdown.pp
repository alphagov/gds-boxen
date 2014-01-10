class people::jcbashdown  {
  include chrome
  include firefox
  include spotify
  include vim
  include caffeine
  include alfred
  include vlc

  # Dev VM
  include vagrant
  include virtualbox
  vagrant::plugin { 'vagrant-dns': }
  include projects::puppet

  include teams::performance-platform

  include projects::deployment
  include projects::vagrant-govuk
  include projects::vcloud-templates

  class { 'gds-ssh-config': }
  ssh_config::fragment{'performance-platform':
    content => template('teams/performance-platform/ssh-config'),
  }

  package {
    [
      'wget',
      'tmux',
      'node',
      'python'
    ]:
    ensure => present,
  }
}
