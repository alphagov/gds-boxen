define repo::gds {
  repository { "${boxen::config::srcdir}/${title}":
    source   => "git@github.digital.cabinet-office.gov.uk:gds/${title}",
  }
}
