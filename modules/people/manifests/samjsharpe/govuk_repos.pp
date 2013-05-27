class people::samjsharpe::govuk_repos ($project_home){
  file { $project_home: ensure => directory }
  # GOV.UK Projects
  repository { "${project_home}/development":
      source   => "git@github.gds:gds/development",
      require  => File[$project_home],
  }
  repository { "${project_home}/deployment":
      source   => "git@github.gds:gds/deployment",
      require  => File[$project_home],
  }
  repository { "${project_home}/env-sync-and-backup":
      source   => "git@github.gds:gds/env-sync-and-backup",
      require  => File[$project_home],
  }
  repository { "${project_home}/fabric-scripts":
      source   => 'alphagov/fabric-scripts',
      require  => File[$project_home],
  }
  repository { "${project_home}/ops-manual":
      source   => "git@github.gds:gds/opsmanual",
      require  => File[$project_home],
  }
  repository { "${project_home}/puppet":
      source   => "git@github.gds:gds/puppet",
      require  => File[$project_home],
  }
  file {"${project_home}/development/Vagrantfile.local":
      content => "
          config.vm.network :hostonly, '10.23.45.67'
          config.vm.customize ['modifyvm', :id, '--memory', 1024]
          config.vm.customize ['modifyvm', :id, '--cpus', 2]
          config.vm.customize ['modifyvm', :id, '--name', 'lucid_dev_vm']
          ",
          require => Repository["${project_home}/development"]
  }
}
