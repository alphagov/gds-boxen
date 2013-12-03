define people::samjsharpe::repos::gh {
    $dirs = split($title, '/')
    $dir = $dirs[0]
    $repo = $dirs[1]
    # Account for alphagov not being gds
    if $dir == "alphagov" {
        $parent = "gds"
        $dest = "${parent}/${repo}"
    } else {
        $parent = $dir
        $dest = $title
    }
    repository { "${people::samjsharpe::repos::home_projects}/${dest}":
        source  => "${title}",
        require => File["${people::samjsharpe::repos::home_projects}/${parent}"],
    }
}
