class teams::performance-platform::puppet {
  include projects::pp-deployment
  include projects::pp-puppet
  include projects::puppet-backdrop

  repo::alphagov { 'puppet-google_credentials': }
}
