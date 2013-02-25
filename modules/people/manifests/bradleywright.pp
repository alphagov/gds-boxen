class people::bradleywright {
  include adium
  include alfred
  include chrome
  include dropbox
  include emacs::pretest
  include iterm2::dev
  include mailplane::beta
  include mysql
  include qt
  include remove-spotlight
  include slate
  include turn-off-dashboard
  include vagrant
  include vagrant-dns
  include virtualbox
  include zsh

  include projects::alphagov-deployment
  include projects::development
  include projects::frontend
  include projects::private-utils
  include projects::puppet
  include projects::redirector
  include projects::rummager
  include projects::static
  include projects::whitehall

  $home     = "/Users/${::luser}"
  $home_projects = "${home}/Projects"

  file { $home_projects:
    ensure => directory,
  }

  # Emacs overrides for Rails projects
  file { "${boxen::config::srcdir}/.dir-locals.el":
    content => "((js2-mode . ((js2-basic-offset . 2)))
 (scss-mode . ((css-indent-offset . 2))))",
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

  $emacs = "${home_projects}/emacs-d"

  repository { $emacs:
    source  => 'bradleywright/emacs-d',
    require => File[$home_projects],
    notify  => Exec['bradleywright-make-emacs-d'],
  }

  exec { 'bradleywright-make-emacs-d':
    command     => "cd ${emacs} && make",
    refreshonly => true,
  }

  file { "${home}/.local_zshenv":
    mode    => '0644',
    content => 'export govuk_dev_dist="lucid"

[[ -f /opt/boxen/env.sh ]] && . /opt/boxen/env.sh

[[ -f /Applications/Emacs.app/Contents/MacOS/bin/emacsclient ]] && path=(/Applications/Emacs.app/Contents/MacOS/bin $path)
'
  }

  file { "${home}/.local_zshrc":
    mode    => '0644',
    content => 'cdpath=(~/src ~/Projects ~)

alias vup="cd ~/src/puppet; git pull; cd ~/src/development; git pull;vagrant destroy; govuk_dev_dist=lucid vagrant up; ssh dev \'govuk_puppet\'; vagrant provision; ssh dev \'cd ~/src/dotfiles && make\'; ssh dev \'sudo rm /etc/tmux.conf\'; ssh dev"
',
  }

  file { "${home}/.localgitconfig":
    mode    => '0644',
    content => '[user]
    email = bradley.wright@digital.cabinet-office.gov.uk
[credential]
    helper = osxkeychain',
  }

  file {"${boxen::config::srcdir}/development/Vagrantfile.local":
    content => '# Predefined IP address, randomly assigned when I ran ./install.sh
config.vm.network :hostonly, "10.244.2.189"
# Give it 2GB of RAM so I can run all the things
config.vm.customize ["modifyvm", :id, "--memory", 2048]

# My puppet configuration
config.vm.provision :puppet do |puppet|
  puppet.manifests_path = "~/Projects/puppet/manifests"
  puppet.manifest_file = "govuk_dev.pp"
  puppet.module_path = "~/Projects/puppet/modules"
end
',
    require => Class['Projects::Development']
  }


  package {
    [
     'bash-completion',
     'parallel',
     'reattach-to-user-namespace',
     'tmux',
     'tree',
     'wget',
     'zsh-completions',
     'zsh-lovers',
     ]:
  }
}
