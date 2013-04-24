class people::annashipman {
  include chrome
  include git
  include turn-off-dashboard
  include vagrant
  include virtualbox
  include wget

  include teams::infrastructure

  include projects::deployment
  include projects::redirector

  $home = "/Users/${::luser}"
  $projects = "${home}/projects"

  file { $projects:
    ensure  => directory,
  }
}
