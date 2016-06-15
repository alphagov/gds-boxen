class people::russellbate {
#Forked from alexmuller

  $home_directory = '/Users/russellbate'

  # Mac apps
  include chrome
  include dropbox
  include firefox
  include spotify
  include sublime_text_3

  # Sublime Text

  include sublime_text_3::package_control

  sublime_text_3::package { 'Backbone.js': source => 'tomasztunik/Sublime-Text-2-Backbone.js-package' }
  sublime_text_3::package { 'GitGutter': source => 'jisaacks/GitGutter' }
  sublime_text_3::package { 'Markdown Preview': source => 'revolunet/sublimetext-markdown-preview' }
  sublime_text_3::package { 'Pretty JSON': source => 'dzhibas/SublimePrettyJson' }
  sublime_text_3::package { 'Puppet': source => 'russCloak/SublimePuppet' }
  sublime_text_3::package { 'Sass': source => 'nathos/sass-textmate-bundle' }
  sublime_text_3::package { 'SublimeLinter': source => 'SublimeLinter/SublimeLinter3' }
  sublime_text_3::package { 'SublimeLinter-jshint': source => 'SublimeLinter/SublimeLinter-jshint' }
  sublime_text_3::package { 'SublimeLinter-pylint': source => 'SublimeLinter/SublimeLinter-pylint' }
  sublime_text_3::package { 'TrailingSpaces': source => 'SublimeText/TrailingSpaces' }

  file { "${home_directory}/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings":
    source => 'puppet:///modules/people/alexmuller/User-Preferences.sublime-settings',
  }

  # Dev VM
  include vagrant
  include gds_virtualbox::42_latest
  vagrant::plugin { 'vagrant-dns': }
  include projects::puppet

  # PP
  include teams::performance-platform

  # Infrastructure and ops
  include gds_vpn_profiles
  include projects::deployment
  include projects::vagrant-govuk
  class { 'teams::infrastructure': manage_gitconfig => false }

  # Other repos

  repo::gds { 'interviews': }

  repo::alphagov { 'design-principles': }
  repo::alphagov { 'government-service-design-manual': }
  include projects::styleguides
  repo::alphagov { 'transformation-dashboard': }


  # Git
  git::config::global { 'alias.master': value => '!git checkout master && git pull origin master' }
  git::config::global { 'color.ui': value => 'true' }
  git::config::global { 'user.name': value => 'Russell Bate' }
  git::config::global { 'user.email': value => 'russell.bate@digital.cabinet-office.gov.uk' }
  git::config::global { 'rebase.autosquash': value => 'true' }

  # Homebrew packages
  # Remember to read the post-install caveats
  homebrew::tap { 'pivotal/tap': }

  package {
    [
      'autojump',
      'bash-completion',
      'cloudfoundry-cli',
      'tree',
      'wget',
    ]:
    ensure => present,
  }

}
