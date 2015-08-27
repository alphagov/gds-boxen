class people::philandstuff {
  include caffeine
  include emacs::formacosx
  include emacs_keybindings
  include flux
  include iterm2::stable
  include openconnect
  include sizeup
  include vagrant

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

  class {'git':
    version => '2.4.6';
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
