class people::samjsharpe::gds_repos ($project_home){
  file { $project_home: ensure => directory }
  #Other GDS Projects
  repository { "${project_home}/boxgrinder-appliances":
    source  => 'alphagov/boxgrinder-appliances',
    require => File[$project_home],
  }
  repository { "${project_home}/vcloud-tools":
    source  => 'alphagov/vcloud-tools',
    require => File[$project_home],
  }
  repository { "${project_home}/machine-bootstrap":
    source  => 'alphagov/machine-bootstrap',
    require => File[$project_home],
  }
  repository { "${project_home}/ubuntu-1204-dev":
    source  => 'alphagov/ubuntu-1204-dev',
    require => File[$project_home],
  }

  repository { "${project_home}/ci-puppet":
    source  => 'alphagov/ci-puppet',
    require => File[$project_home],
  }
  # Performance Platform
  repository { "${project_home}/pp-puppet":
    source  => 'alphagov/pp-puppet',
    require => File[$project_home],
  }
  repository { "${project_home}/pp-deployment":
    source  => "git@github.gds:gds/pp-deployment",
    require => File[$project_home],
  }
}
