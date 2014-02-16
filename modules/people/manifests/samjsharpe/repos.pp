class people::samjsharpe::repos {

    $home              = "/Users/${::luser}"
    $home_projects     = "${home}/Projects"

    file {[
        "${home_projects}/gds",
        "${home_projects}/gds-operations",
        "${home_projects}/hmrc",
        "${home_projects}/samjsharpe",
    ]:
        ensure => directory
    }

    # HMRC repos
    people::samjsharpe::repos::gh  {'hmrc/base-image-builder':}

    people::samjsharpe::repos::gds {[
        'hmrc/vcb',
        ]:}

    # GDS Repos
    people::samjsharpe::repos::gds {[
        'gds/deployment',
        'gds/development',
        'gds/env-sync-and-backup',
        'gds/opsmanual',
        'gds/private-utils',
        'gds/puppet'
        ]:}

    file {"${boxen::config::srcdir}/gds/puppet/development/Vagrantfile.localconfig":
      source => 'puppet:///modules/people/samjsharpe/Vagrantfile.localconfig',
      require => People::Samjsharpe::Repos::Gds['gds/puppet']
    }

    people::samjsharpe::repos::gh  {[
        'alphagov/ci-puppet',
        'alphagov/boxgrinder-appliances',
        'alphagov/fabric-scripts',
        'alphagov/machine-bootstrap',
        'alphagov/service-domain-checker',
        'alphagov/ubuntu-1204-dev',
        'alphagov/vcloud-tools'
        ]:}

    people::samjsharpe::repos::gh {[
        'gds-operations/monitoring-inabox',
        'gds-operations/open-source-guidelines',
        'gds-operations/puppet-auditd',
        'gds-operations/puppet-elasticsearch',
        'gds-operations/puppet-graphite',
        'gds-operations/puppet-hosts',
        'gds-operations/puppet-module-skeleton',
        'gds-operations/puppet-openconnect',
        'gds-operations/puppet-rbenv',
        'gds-operations/puppet-resolvconf',
        'gds-operations/puppet-skeleton',
        'gds-operations/puppet-syntax',
        'gds-operations/puppet-updatemotd'
        ]:}

    # Personal repos
    people::samjsharpe::repos::gh  {[
        'samjsharpe/fgaas',
        'samjsharpe/samjsharpe.github.com',
        'samjsharpe/vagrant-centos',
        'samjsharpe/vagrant-rackspace',
        'samjsharpe/vagrant-ubuntu'
        ]:}

    people::samjsharpe::repos::gh  {'samjsharpe/dotfiles': notify => Exec['samjsharpe-link-my-dotfiles'] }
    exec {'samjsharpe-link-my-dotfiles':
      command     => "${home_projects}/samjsharpe/dotfiles/link.sh",
      refreshonly => true,
    }

}
