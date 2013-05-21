class people::alexmuller {
  include alfred
  include chrome
  include firefox
  include spotify
  include sublime_text_2
  include vagrant_gem
  include vagrant-dns
  include vagrant-vbguest
  include virtualbox

  include teams::performance-platform

  #include osx::dock::2d
  #include osx::dock::autohide

  package {
    [
      'autojump',
    ]:
    ensure => present,
  }
}
