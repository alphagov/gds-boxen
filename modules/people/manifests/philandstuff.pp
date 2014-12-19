class people::philandstuff {
  include caffeine
  include emacs::formacosx
  include emacs_keybindings
  include flux
  include iterm2::stable
  include openconnect
  include sizeup
  include vagrant

  include projects::deployment
  include projects::deployment::creds

  include teams::infrastructure

  nodejs::version { 'v0.10.31': }
  class { 'nodejs::global':
    version => 'v0.10'
  }

  package {
    [
      'bash-completion',
      'fakeroot',
      'leiningen',
      'markdown',
      'python',
      'tmux',
    ]:
    ensure => present,
  }

  package {
    ['virtualenv','virtualenvwrapper']:
    ensure => present,
    provider => pip,
  }

  git::config::global {
    'color.ui':     value => "true";
    'push.default': value => "simple";
  }

  vagrant::plugin { 'vagrant-cachier': }

  $home = "/Users/${::luser}"

  file {"${home}/.bashrc":
    source => 'puppet:///modules/people/philandstuff/bashrc',
  }

  file { "${home}/.lein/profiles.clj":
    source => 'puppet:///modules/people/philandstuff/lein-profiles.clj',
  }

  repository { "${home}/.emacs.d":
    source => 'git@github.com:philandstuff/dot-emacs.git',
  }
}
