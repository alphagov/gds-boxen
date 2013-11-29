class people::samjsharpe::hmrc_repos ($project_home){
  file { $project_home: ensure => directory }
  # HMRC Projects
  repository { "${project_home}/hmrc-opsmanual":
    source  => "git@github.gds:HMRC/opsmanual",
    require => File[$project_home],
  }
  repository { "${project_home}/local-dev-vm":
    source  => "git@github.gds:HMRC/local-dev-vm",
    require => File[$project_home],
  }
  repository { "${project_home}/puppet-test":
    source  => "git@github.gds:HMRC/puppet-test",
    require => File[$project_home],
  }
  repository { "${project_home}/base-image-builder":
    source  => 'hmrc/base-image-builder',
    require      => File[$project_home],
  }
  repository { "${project_home}/puppet":
    source   => "git@github.gds:HMRC/puppet",
    require      => File[$project_home],
  }
  repository { "${project_home}/puppet-secrets":
    source   => "git@github.gds:HMRC/puppet-secrets",
    require      => File[$project_home],
  }
  repository { "${project_home}/vcb":
    source   => "git@github.gds:HMRC/vcb",
    require      => File[$project_home],
  }
  repository { "${project_home}/firewall-rule-generator":
    source   => "git@github.gds:HMRC/firewall-rule-generator",
    require      => File[$project_home],
  }
  repository { "${project_home}/vcloud-config":
    source   => "git@github.gds:HMRC/vcloud-config",
    require      => File[$project_home],
  }
  repository { "${project_home}/deployment":
    source   => "git@github.gds:HMRC/deployment",
    require      => File[$project_home],
  }
}
