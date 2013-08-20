
class people::tombooth {
  include iterm2::stable
  include vagrant
  include chrome
  include emacs::formacosx
  include flux
  include gds-resolver
  
  include teams::performance-platform
  include teams::infrastructure
  
  include gds-development
}
