
class people::tombooth {
  include iterm2::stable
  include vagrant
  include chrome
  include emacs::formacosx
  include flux
  include gds_resolver

  include teams::performance-platform
  class { 'teams::infrastructure': manage_gitconfig => false }

  include gds_development
  include ssh_config
}
