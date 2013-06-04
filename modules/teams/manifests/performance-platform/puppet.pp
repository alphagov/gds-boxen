class teams::performance-platform::puppet {
  include projects::pp-puppet-secrets
  include projects::pp-puppet
  include projects::puppet-backdrop
}
