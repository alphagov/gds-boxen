class people::edwardhorsford{
  include vagrant_gem
  include vagrant-dns
  include vagrant-vbguest

  include teams::performance-platform
  repo::alphagov { 'static': }

}
