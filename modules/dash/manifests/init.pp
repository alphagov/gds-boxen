# Public: Install Dash to /Applications
# 
# Dash is a documentation search tool. 
# 
# See https://kapeli.com/dash
#
# Sample Usage:
#
#  include dash
#
class dash {
  package { 'Dash':
    provider => 'compressed_app',
    source   => 'https://london.kapeli.com/Dash.zip'
  }
}
