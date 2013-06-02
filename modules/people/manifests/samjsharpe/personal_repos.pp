class people::samjsharpe::personal_repos ($project_home){
  file { $project_home: ensure => directory }
  # Personal projects
  repository { "${project_home}/website":
    source => 'samjsharpe/samjsharpe.github.com',
    require  => File[$project_home],
  }
  repository { "${project_home}/vagrant-centos":
    source => 'samjsharpe/vagrant-centos',
    require  => File[$project_home],
  }
  repository { "${project_home}/vagrant-rackspace":
    source => 'samjsharpe/vagrant-rackspace',
    require  => File[$project_home],
  }
  repository { "${project_home}/vagrant-ubuntu":
    source => 'samjsharpe/vagrant-ubuntu',
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
