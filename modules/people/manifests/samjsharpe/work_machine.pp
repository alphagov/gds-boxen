class people::samjsharpe::work_machine {


    $home              = "/Users/${::luser}"
    $home_projects     = "${home}/Projects"
    $govuk_projects    = "${home_projects}/govuk"
    $gds_projects      = "${home_projects}/gds"
    $personal_projects = "${home_projects}/personal"
    $hmrc_projects     = "${home_projects}/hmrc"

    class { 'people::samjsharpe::gds_repos':
      project_home => $gds_projects,
    }
    class { 'people::samjsharpe::govuk_repos':
      project_home => $govuk_projects,
    }
    class { 'people::samjsharpe::personal_repos':
      project_home => $personal_projects,
    }
    class { 'people::samjsharpe::hmrc_repos':
      project_home => $hmrc_projects,
    }
    include chrome
    include controlplane
    include gds-resolver
    include googledrive
    include gnupg
    include macvim
    include mou
    include mou::themes
    include openconnect
    include osx::finder::empty_trash_securely
    include screen
    include sublime_text_2
    package {
      [
        'brew-pip',
        'brew-gem',
        'colordiff',
        'fping',
        'heroku-toolbelt',
        's3cmd',
        'ssh-copy-id',
        'sslscan',
        'tmux',
      ]:
      ensure => present,
    }
    osx::recovery_message { 'If found, please call +44 (0) 7788 947 401': }
}
