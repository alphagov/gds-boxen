class people::samjsharpe {

  $home              = "/Users/${::luser}"

  if $::hostname == 'Sams-MacBook-Air-2' {
    # Things to install on my home machine
    include people::samjsharpe::home_machine
  } 
  if $::hostname == 'Sams-MacBook-Pro' {
    # Things to install on my work machine
    include people::samjsharpe::work_machine
  }
  if $::hostname == 'Sams-Air' {
    # Things to install on my old Air
    include people::samjsharpe::air_machine
  }
  # Things to install everywhere
  include people::samjsharpe::common_machine

}
