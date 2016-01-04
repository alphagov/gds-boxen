class people::carolinegreen {
  include dropbox
  include iterm2::stable
  include zsh
  include slate
  #include projects::deployment::creds
  include teams::performance-platform

  package {
    [
      'tree',
      'ag',
      'fasd',
      'python',
      'ssh-copy-id',
      'tmux',
      'reattach-to-user-namespace',
      'bash-completion',
      'pyenv',
      'gpg',
      'gpg-agent',
      'ansible',
      'hg',
      'gnu-sed',
      'leiningen',
      'postgres',
      'tig',
      'jq',
      'brew-cask',
      'graphviz',
      'siege',
    ]:
    ensure => present,
  }

  package {
    [
      'alfred',
      'gephi',
      'flux',
    ]:
    ensure   => present,
    provider => 'brewcask',
    require  => Package['brew-cask'],
  }

  include python::3_3_0

  package {
    [
      'virtualenv',
      'virtualenvwrapper',
    ]:
    ensure   => present,
    provider => pip,
    require  => Package['python'],
  }

  class { 'gds_ssh_config': }
  #ssh_config::fragment {"user":
  #  content => template('people/carolinegreen/ssh_config'),
  #}
  homebrew::tap { 'caskroom/cask': }
  class { 'vagrant':
      version => '1.7.2'
  }
  vagrant::plugin { 'cachier': }
  vagrant::plugin { 'dns': }
  vagrant::plugin { 'multiprovider-snap': }
  vagrant::plugin { ['vagrant-global-status','vagrant-vbguest']:
    ensure => absent,
  }
  include virtualbox
  include vmware_fusion
  include sourcecodepro
  class { 'osx::sound::interface_sound_effects':
      enable => false
  }

  }
