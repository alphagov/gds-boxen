
class people::tombooth {
  include iterm2::stable
  include vagrant
  include dropbox
  include chrome
  include emacs::formacosx
  include flux
  include gds-resolver
  
  include projects::puppet
  include projects::alphagov-deployment
  
  include gds-development

}
