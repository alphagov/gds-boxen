class people::samjsharpe::work_machine {

    $home              = "/Users/${::luser}"
    $home_projects     = "${home}/Projects"
    $govuk_projects    = "${home_projects}/govuk"
    $gds_projects      = "${home_projects}/gds"
    $personal_projects = "${home_projects}/personal"

    class { 'people::samjsharpe::gds_repos':
      project_home => $gds_projects,
    }
    class { 'people::samjsharpe::govuk_repos':
      project_home => $govuk_projects,
    }
    class { 'people::samjsharpe::personal_repos':
      project_home => $personal_projects,
    }
    include chrome
    include encfs
    include gds-resolver
    include gnupg
    include osx::finder::empty_trash_securely
    include vagrant_gem
    include vagrant-dns
    include vagrant-vbguest
    include virtualbox::latest
    osx::recovery_message { 'If found, please call +44 (0) 7788 947 401': }
}
