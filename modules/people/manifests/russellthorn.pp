class people::russellthorn {
  $vagrant_ip = '10.1.1.254'

  include gds_development
  include gds_resolver

  class { 'gds_ssh_config': }
  ssh_config::fragment{'user':
    content => template('people/russellthorn/ssh_config'),
  }

  include projects::development
  include projects::frontend
  include projects::govuk_frontend_toolkit
  include projects::static
  include projects::whitehall
}
