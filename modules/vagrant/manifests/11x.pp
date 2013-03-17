# Public: Install Vagrant 1.1.x from a system package.
#
# Examples
#
#   include vagrant::11x
#
class vagrant::11x {
  package { 'vagrant':
    provider => 'pkgdmg',
    source   => 'http://files.vagrantup.com/packages/194948999371e9aee391d13845a0bdeb27e51ac0/Vagrant.dmg',
  }
}
