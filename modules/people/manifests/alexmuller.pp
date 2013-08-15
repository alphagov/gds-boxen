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

  class { 'gds-ssh-config': extra => template('teams/performance-platform/ssh-config') }

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
