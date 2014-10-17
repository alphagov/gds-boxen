# Public: Install Xbench.app into /Applications.
#
# It's a tool for benchmarking your Mac
# http://xbench.com/
#
# Examples
#
#   include xbench
class xbench {
  package { 'XBench':
    provider => 'appdmg',
    source   => 'http://xbench.com/Xbench_1.3.dmg'
  }
}
