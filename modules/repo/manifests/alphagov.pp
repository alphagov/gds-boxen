define repo::alphagov {
  repository { "${boxen::config::srcdir}/${title}":
    source   => "git@github.com:alphagov/${title}",
  }
}
