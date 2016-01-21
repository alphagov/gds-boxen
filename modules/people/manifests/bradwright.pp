class people::bradwright {
  include adium
  include alfred
  include chrome
  include dropbox
  include emacs_keybindings
  include gds_osx::turn_off_dashboard
  include gds_vpn_profiles
  include flux
  include iterm2::dev
  include iterm2::colors::solarized_dark
  include mailplane
  include nginx
  include notational_velocity::nvalt
  include omnifocus
  include qt
  include slate
  include vmware_fusion
  include x_dispatch
  include zsh

  # Null out El Capitan's zprofile so it doesn't break my path:
  # http://www.zsh.org/mla/users/2015/msg00724.html
  file { '/etc/zprofile':
    content => ''
  }

  class { 'nodejs::global': version => '0.10.33' }

  osx_login_item { 'OmniFocus':
    name    => 'OmniFocus',
    path    => '/Applications/OmniFocus.app',
    require => Class['OmniFocus']
  }

  osx_login_item { 'Slate':
     name    => 'Slate',
     path    => '/Applications/Slate.app',
     hidden  => true,
     require => Class['Slate'],
  }

  $vagrant_ip = '10.1.1.254'

  class { 'gds_ssh_config': }
  ssh_config::fragment{'user':
    content => template('people/bradleywright/ssh_config'),
  }

  include projects::alphagov-deployment
  include projects::development
  include projects::fabric-scripts
  include projects::frontend
  include projects::govuk_frontend_toolkit
  include projects::private-utils
  include projects::puppet
  include projects::transition-config
  include projects::router
  include projects::rummager
  include projects::smokey
  include projects::static
  include projects::whitehall

  class { 'osx::global::key_repeat_delay':
    delay => 200
  }

  class { 'osx::global::key_repeat_rate':
    rate => 400
  }

  class { 'gds_development':
    version => '1.5.3',
  }

  vagrant::plugin { 'cachier': }
  vagrant::plugin { 'vagrant-vmware-fusion': }

  $home     = "/Users/${::luser}"
  $home_projects = "${home}/Projects"

  file { $home_projects:
    ensure => directory,
  }

  # Emacs overrides for Rails projects
  file { "${boxen::config::srcdir}/.dir-locals.el":
    source  => 'puppet:///modules/people/bradleywright/govuk-dir-locals.el',
    require => File["${boxen::config::srcdir}"],
  }

  $dotfiles = "${home_projects}/dotfiles"

  repository { $dotfiles:
    source  => 'bradleywright/dotfiles',
    require => File[$home_projects],
    notify  => Exec['bradleywright-make-dotfiles'],
  }

  exec { 'bradleywright-make-dotfiles':
    command     => "cd ${dotfiles} && make",
    refreshonly => true,
  }

  $emacs = "${home_projects}/emacs.d"

  repository { $emacs:
    source  => 'bradleywright/emacs.d',
    require => File[$home_projects],
    notify  => Exec['bradleywright-make-emacs-d'],
  }

  exec { 'bradleywright-make-emacs-d':
    command     => "cd ${emacs} && make",
    refreshonly => true,
  }

  file { "${home}/.emacs.d/local/${::hostname}.el":
    mode    => '0644',
    source  => 'puppet:///modules/people/bradleywright/emacs-host-local.el',
    require => Repository[$emacs],
  }

  file { "${home}/.local_zshenv":
    mode   => '0644',
    source => 'puppet:///modules/people/bradleywright/local_zshenv',
  }

  file { "${home}/.local_zshrc":
    mode   => '0644',
    source => 'puppet:///modules/people/bradleywright/local_zshrc',
  }

  git::config::global { 'user.email':
    value => 'bradley.wright@digital.cabinet-office.gov.uk'
  }

  git::config::global { 'include.path':
    value => "${home}/.local_gitconfig",
  }

  file {"${boxen::config::srcdir}/govuk-puppet/development/Vagrantfile.localconfig":
    source => 'puppet:///modules/people/bradleywright/Vagrantfile.localconfig',
    require => Class['Projects::Development']
  }

  # Want latest versions
  package {
    [
     'bash-completion',
     'parallel',
     'python',
     'reattach-to-user-namespace',
     'the_silver_searcher',
     'tmux',
     'tree',
     'wget',
     'zsh-completions',
     'zsh-lovers',
     ]:
       ensure => latest
  }
  # Don't need latest versions
  package {
    [
     'ctags',
     ]:
  }

  # Go
  package { 'go':
    ensure   => latest,
    provider => homebrew,
    notify   => Exec['install_go_tools'],
  }

  exec { 'install_go_tools':
    environment => ["GOPATH=${home}/go"],
    command => 'go get golang.org/x/tools/cmd/godoc \
                && go get golang.org/x/tools/cmd/vet \
                && go get github.com/nsf/gocode',
    provider    => shell,
    refreshonly => true,
  }

  homebrew::tap { 'homebrew/binary': }
  package { 'packer': }

  # Use my own Git config, thanks.
  Git::Config::Global <| title == "core.excludesfile" |> {
    value => "~/.gitignore"
  }

  # Keyboard hacks
  include karabiner
  include karabiner::login_item

  karabiner::profile { 'Default': }

  # Tap Ctrl_l for <esc>, hold for <ctrl>
  karabiner::remap { 'controlL2controlL_escape': }
  karabiner::set { 'parameter.keyoverlaidmodifier_timeout':
    value => '300'
  }
  karabiner::set { 'repeat.keyoverlaidmodifier_initial_wait':
    value => '400'
  }

  karabiner::private_xml { 'private.xml':
    source => 'puppet:///modules/people/bradleywright/private.xml'
  }

  karabiner::remap { 'space_cadet.force_correct_shifts': }
  karabiner::remap { 'space_cadet.force_correct_commands': }

  # For external keyboard
  karabiner::remap { ['remap.pc_application2fn', 'remap.pc_printscreen_scrolllock_pause_to_volume_controls']: }

  # Emacs
  package { 'Emacs':
    provider => 'appdmg',
    source   => 'http://emacsformacosx.com/emacs-builds/Emacs-24.4-universal.dmg',
    notify   => Exec['fix-emacs-termcap'],
  }

  # So ansi-term behaves itself: http://stackoverflow.com/a/8920373
  exec { 'fix-emacs-termcap':
    command     => 'tic -o \
      ~/.terminfo \
      /Applications/Emacs.app/Contents/Resources/etc/e/eterm-color.ti',
    provider    => shell,
    refreshonly => true,
  }

  file { "${boxen::config::envdir}/emacs-macosx.sh":
    content => "export PATH=/Applications/Emacs.app/Contents/MacOS/bin:\$PATH
alias emacs=/Applications/Emacs.app/Contents/MacOS/Emacs
",
    require => File[$boxen::config::envdir],
  }
}
