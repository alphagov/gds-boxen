class people::samjsharpe::personal_repos ($project_home){
  file { $project_home: ensure => directory }
  # Personal projects
  repository { "${project_home}/website":
    source => 'samjsharpe/samjsharpe.github.com',
    require  => File[$project_home],
  }
  repository { "${project_home}/rackspace":
    source => 'samjsharpe/rackspace',
    require  => File[$project_home],
  }
  repository { "${project_home}/ubuntu-1204-vmware":
    source => 'samjsharpe/ubuntu-1204-vmware',
    require  => File[$project_home],
  }
  repository { "${project_home}/dotfiles":
    source  => 'samjsharpe/dotfiles',
    notify  => Exec['samjsharpe-link-my-dotfiles'],
    require  => File[$project_home],
  }
  exec {'samjsharpe-link-my-dotfiles':
    command     => "${project_home}/dotfiles/link.sh",
    refreshonly => true,
  }
}
