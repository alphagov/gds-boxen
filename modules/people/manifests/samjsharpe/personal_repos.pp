class people::samjsharpe::personal_repos ($project_home){
  # Personal projects
  repository { "${project_home}/website":
    source => 'samjsharpe/samjsharpe.github.com'
  }
  repository { "${project_home}/rackspace":
    source => 'samjsharpe/rackspace'
  }
  repository { "${project_home}/dotfiles":
    source  => 'samjsharpe/dotfiles',
    notify  => Exec['samjsharpe-link-my-dotfiles'],
  }
  exec {'samjsharpe-link-my-dotfiles':
    command     => "${project_home}/dotfiles/link.sh",
    refreshonly => true,
  }
}
