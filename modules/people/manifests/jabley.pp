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

  $home = "/Users/${::luser}"
  $projects = "${home}/Projects"

  file { [$projects]:
    ensure  => directory,
  }
}
