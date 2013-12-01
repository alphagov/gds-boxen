define people::samjsharpe::repos::gh {
    $dirs = split($title, '/')
    $dir = $dirs[0]
    repository { "${people::samjsharpe::repos::home_projects}/${title}":
        source  => "${title}",
        require => File["${people::samjsharpe::repos::home_projects}/${dir}"],
    }
}
