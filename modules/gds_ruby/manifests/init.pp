# Installs all the Rubys
#
# The default list can be easily overridden in hiera/users/username.yaml
# with something like:
#       gds_ruby::versions:
#           - 1.9.3
#           - 2.0.0
#       gds_ruby::deprecated:
#           - 1.8.7
#           - 2.1.1
#           - 2.1.2
#       # needed to work around boxen
#       # must alias removed ruby aliases to a version that remains installed
#       # otherwise removing the alias fails because it tries to require
#       # the ruby version being removed. In my example above, most deprecated
#       # ones are straight versions, not aliases - the aliases are all symlinks
#       # in /opt/rubies
#       ruby::version::alias:
#           1.8.7: 1.9.3-p545
#
class gds_ruby (
  $versions   = ['1.8.7','1.9.3','2.0.0','2.1.0','2.1.2'],
  $deprecated = ['2.1.1'],
) {

  include ruby

  # default ruby versions
  if !(empty($versions)) {
    ruby::version {$versions: }
  }

  if !(empty($deprecated)) {
    ruby::version {$deprecated: ensure => absent}
  }

  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.5.3',
    ruby_version => '*',
  }
}
