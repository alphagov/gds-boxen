# Configure printers for Aviation House.
#
# You will need to override `ldap_username` if your LDAP username differs
# from your local login username.
#
class gds_printers (
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
}
