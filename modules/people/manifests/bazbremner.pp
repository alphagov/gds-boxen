class people::bazbremner {
  include alfred
  include caffeine
  include chrome
  include dropbox
  include emacs::formacosx
  include flux
  include gitx::dev
  include iterm2::colors::solarized_dark
  include iterm2::dev
  include notational_velocity::nvalt
  include sizeup
  include xquartz

  include gds_development

  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::global::enable_keyboard_control_access
  include osx::global::key_repeat_delay
  include osx::global::key_repeat_rate
  include osx::no_network_dsstores
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::unhide_library

  class { 'nodejs::global': version => 'v0.12.7' }

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  package {
    [
      'ansible',
      'aspell',
      'bash-completion',
      'cask',
      'emacs',
      'gpg',
      'jq',
      'leiningen',
      'maven',
      'sipcalc',
      'the_silver_searcher',
      'tree',
      'tmux',
     ]:
     ensure => latest,
  }

  package {
    [
      'wget',
     ]:
     ensure => present,
  }

  package { 'python':
    ensure => present,
  } ->
  package {
    ['virtualenv', 'virtualenvwrapper']:
    ensure   => present,
    provider => pip,
  }

  $home = "/Users/${::luser}"
  $code = "${home}/code"
  $work = "${home}/gds"

  file { [$code, $work]:
    ensure => directory,
  }

  repository { "${home}/.emacs.d":
    source => 'git@github.com:bazbremner/dot-emacs.git',
  }

}
