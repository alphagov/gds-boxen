class people::deanwilson {

  include iterm2::stable
  include vagrant
  include virtualbox

  class { 'teams::infrastructure': manage_gitconfig => false }

  # git repos
  include projects::vagrant-govuk

  class { 'gds_ssh_config': }

  package {
    [
      'aspell',
      'gpg',
      'gpg-agent',
      'packer',
      'pass',
      'the_silver_searcher',
    ]:
  }


  ## python stuff ##
  package {
    [
      'python',
    ]:
  }

  package {
    [ 'virtualenv', 'virtualenvwrapper' ]:
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }

  ####
}
