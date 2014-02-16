class people::roc {
  include chrome
  include gds_resolver
  include git
  include vagrant
  vagrant::plugin { 'vagrant-dns': }
  include gds_virtualbox
  include wget
  include dropbox
  include firefox
  # include sublime_text_3

  # Team repos
  include teams::performance-platform
  repo::alphagov { 'government-service-design-manual': }


  # Homebrew packages
  package {
    [
      'bash-completion',
      'redis'
    ]:
    ensure => present,
  }


}
