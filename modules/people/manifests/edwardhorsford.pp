class people::edwardhorsford{
  include gds_development
  include nodejs::v0_10

  package {
    [
      'node',
      'sbt'
    ]:
    ensure => 'present',
  }
}


