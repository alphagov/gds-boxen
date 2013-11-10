class people::samjsharpe::air_machine {


    $home              = "/Users/${::luser}"
    $home_projects     = "${home}/Projects"
    $hmrc_projects    = "${home_projects}/hmrc"
    $personal_projects = "${home_projects}/personal"

    class { 'people::samjsharpe::hmrc_repos':
      project_home => $hmrc_projects,
    }
    class { 'people::samjsharpe::personal_repos':
      project_home => $personal_projects,
    }
    include gds-resolver
    include gnupg
    include openconnect
    include osx::finder::empty_trash_securely
    include screen
    package {
      [
        'colordiff',
        'fping',
      ]:
      ensure => present,
    }
    osx::recovery_message { 'If found, please call +44 (0) 7712 046 007': }
}
