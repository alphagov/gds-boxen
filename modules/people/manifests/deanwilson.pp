class people::deanwilson {

  include iterm2::stable
  include vagrant
  include virtualbox

  class { 'teams::infrastructure': manage_gitconfig => false }

  # git repos
  include projects::vagrant-govuk

  package {
    [
      'gpg',
      'gpg-agent',
      'the_silver_searcher',
    ]:
  }


}
