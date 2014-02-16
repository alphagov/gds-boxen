class people::edwardhorsford{
  include gds_development
  vagrant::plugin { 'vagrant-cachier': }

  include teams::performance-platform
  repo::alphagov { 'static': }


}
