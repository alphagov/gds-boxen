class people::roc {
  include chrome
  include gds-resolver
  include git
  # include vagrant
  include vagrant_gem
  include vagrant-dns
  include virtualbox
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