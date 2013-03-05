define repo::gds {
  repository { "${boxen::config::srcdir}/${title}":
    source   => "git@github.gds:gds/${title}",
  }
}
