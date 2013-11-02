class people::samjsharpe::hmrc_repos ($project_home){
  file { $project_home: ensure => directory }
  #Other GDS Projects
  repository { "${project_home}/machine-bootstrap":
    source  => 'alphagov/machine-bootstrap',
    require      => File[$project_home],
  }
}
