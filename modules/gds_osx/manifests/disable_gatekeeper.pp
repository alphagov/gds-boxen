# Disables Mac OS X GateKeeper. This is the system feature that only allows app to be installed from the App Store.
# By disabling this it allows apps to be installed from other sources.  
class gds_osx::disable_gatekeeper {
  exec { 'disable-gatekeeper':
    command => 'sudo spctl --master-disable'
  }
}