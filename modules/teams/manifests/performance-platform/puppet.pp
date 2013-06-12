class teams::performance-platform::puppet {
  include projects::pp-deployment
  include projects::pp-puppet
  include projects::puppet-backdrop
  include projects::pp-puppet-varnish
}
