# Public: Install Vagrant 1.1.x from a system package.
#
# Examples
#
#   include vagrant::11x
#
class vagrant::11x {
  package { 'vagrant':
    provider => 'pkgdmg',
    source   => 'http://files.vagrantup.com/packages/67bd4d30f7dbefa7c0abc643599f0244986c38c8/Vagrant.dmg',
  }
}
