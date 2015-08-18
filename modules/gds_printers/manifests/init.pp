# Configure printers for Aviation House.
#
# You will need to override `ldap_username` if your LDAP username differs
# from your local login username.
#
class gds_printers (
  $driver_3_il0 = 'drv:///sample.drv/generic.ppd',
  $ldap_username = $::boxen_user,
) {
  printer { 'Secure_Printer_4':
    ensure      => present,
    description => 'Secure Printer 4',
    location    => '6th floor, Aviation House',
    uri         => "lpd://${ldap_username}@192.168.9.45/Printer4",
    model       => 'drv:///sample.drv/generic.ppd',
    page_size   => 'A4',
    ppd_options => {
      'Option1' => 'True', # Duplexer
    },
  }

  printer { '3rd_Floor_IL0_Printer':
    ensure      => present,
    description => '3rd Floor IL0 Printer',
    location    => '3rd floor, Aviation House',
    uri         => "lpd://${ldap_username}@192.168.9.47/FollowPrint",
    model       => $driver_3_il0,
    page_size   => 'A4',
    ppd_options => {
      'Option1' => 'True', # Duplexer
    },
  }

}
