class people::samjsharpe::home_machine {

    $home              = "/Users/${::luser}"
    $home_projects     = "${home}/Projects"
    $personal_projects = "${home_projects}/personal"

    class { 'people::samjsharpe::personal_repos':
      project_home => $personal_projects,
    }
    include chicken
    include vagrant_no_vbox
}
