class people::samjsharpe {

  $home              = "/Users/${::luser}"

  if $::hostname != 'Sams-MacBook-Air' {
    # Things to install on my work machine
    include people::samjsharpe::work_machine
  } else {
    # Things to install on my home machine
    include people::samjsharpe::home_machine
  }
  # Things to install everywhere
  include people::samjsharpe::common_machine

}
