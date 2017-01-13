class people::philandstuff {
  include caffeine
  include emacs::formacosx
  include emacs_keybindings
  include flux
  include iterm2::stable
  include sizeup
  include vagrant

  package {
    [
      'bash-completion',
      'markdown',
      'python',
      'tmux',
    ]:
    ensure => present,
  }

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
