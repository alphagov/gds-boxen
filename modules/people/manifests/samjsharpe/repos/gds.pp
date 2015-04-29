define people::samjsharpe::repos::gds {
    $dirs = split($title, '/')
    $dir = $dirs[0]
    $repo = $dirs[1]

    repository { "${people::samjsharpe::repos::home_projects}/${title}":
        source  => "git@github.gds:${source}",
        require => File["${people::samjsharpe::repos::home_projects}/${dir}"],
    }
}
