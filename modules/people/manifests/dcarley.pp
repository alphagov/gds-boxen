class people::dcarley {
  include adium
  include chrome
  include iterm2::stable
  include virtualbox

  # Projects accessible to everyone in Infrastructure
  include teams::infrastructure
  # Projects only accessible to certain staff
  include projects::deployment
  include projects::vcloud-templates

  # These are all Homebrew packages
  package {
    [
      'git', 'gnupg', 'go', 'wget'
    ]:
    ensure => present,
  }
}
