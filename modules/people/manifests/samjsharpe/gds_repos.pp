class people::samjsharpe::gds_repos ($project_home){
  #Other GDS Projects
  repository { "${project_home}/boxgrinder-appliances":
    source  => 'alphagov/boxgrinder-appliances',
  }
  repository { "${project_home}/machine-bootstrap":
    source  => 'alphagov/machine-bootstrap',
  }
  repository { "${project_home}/ubuntu-1204-dev":
    source  => 'alphagov/ubuntu-1204-dev',
  }

  # Performance Platform
  repository { "${project_home}/pp-puppet":
    source  => 'alphagov/pp-puppet',
  }
  repository { "${project_home}/pp-puppet-secrets":
    source   => "git@github.gds:gds/pp-puppet-secrets"
  }
}
