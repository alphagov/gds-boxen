class people::alexmuller {
  # Mac apps
  include chrome
  include dropbox
  include firefox
  include spotify
  include sublime_text_2

  # Dev VM
  include vagrant
  include virtualbox
  vagrant::plugin { 'vagrant-dns': }
  include projects::puppet

  # PP
  include teams::performance-platform

  # Infrastructure and ops
  include gds_vpn_profiles
  include projects::deployment
  include projects::vagrant-govuk
  include projects::vcloud-templates
  class { 'teams::infrastructure': manage_gitconfig => false }

  # Repos
  repo::alphagov { 'transformation-dashboard': }
  repo::alphagov { 'government-service-design-manual': }

  # SSH
  class { 'gds-ssh-config': }
  ssh_config::fragment { 'performance-platform':
    content => template('teams/performance-platform/ssh-config'),
  }
  ssh_config::fragment { 'alexmuller':
    source => 'puppet:///modules/people/alexmuller/ssh-config',
  }

  # Git
  git::config::global { 'color.ui': value => 'true' }
  git::config::global { 'user.name': value => 'Alex Muller' }
  git::config::global { 'user.email': value => 'alex.muller@digital.cabinet-office.gov.uk' }

  # Homebrew packages
  # Remember to read the post-install caveats
  package {
    [
      'autojump',
      'bash-completion',
      'tree',
      'wget',
    ]:
    ensure => present,
  }

  $home_directory = '/Users/alexmuller'

  # Vim config
  file { "${home_directory}/.vimrc":
    source => 'puppet:///modules/people/alexmuller/vimrc',
  }

  # .bash_profile
  file { "${home_directory}/.bash_profile":
    source => 'puppet:///modules/people/alexmuller/bash_profile',
  }

  # Sublime Text 2 configuration
  file { "${home_directory}/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings":
    source => 'puppet:///modules/people/alexmuller/User-Preferences.sublime-settings',
  }

  sudoers { 'alexmuller_sudo':
    users    => $::boxen_user,
    type     => 'user_spec',
    commands => '(ALL) NOPASSWD: ALL',
    hosts    => 'ALL',
    comment  => 'Stop asking me to sudo',
  }
}
