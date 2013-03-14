class people::jabley {
  include adium
  include alfred
  include caffeine
  include chrome
  include dropbox
  include firefox
  include git
  include gnupg
  include turn-off-dashboard
  include vagrant
  include vagrant-dns
  include virtualbox

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment

  $home = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { [$projects]:
    ensure  => directory,
  }
}
