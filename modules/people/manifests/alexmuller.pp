class people::alexmuller {
  include alfred
  include chrome
  include firefox
  include spotify
  include sublime_text_2

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
  ssh_config::fragment{'alexmuller':
    source => 'puppet:///modules/people/alexmuller/ssh-config',
  }

  #include osx::dock::2d
  #include osx::dock::autohide

  package {
    [
      'autojump',
      'tree',
      'wget',
    ]:
    ensure => present,
  }
}
