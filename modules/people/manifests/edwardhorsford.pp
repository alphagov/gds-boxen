class people::edwardhorsford{
  include gds-development
  vagrant::plugin { 'vagrant-cachier': }

  include teams::performance-platform
  repo::alphagov { 'static': }


}
