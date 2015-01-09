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
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::unhide_library
  include sizeup
  include xquartz

  include gds_development

  package {
    [
      'ansible',
      'bash-completion',
      'cask',
      'emacs',
      'gpg',
      'leiningen'
      'jq',
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
