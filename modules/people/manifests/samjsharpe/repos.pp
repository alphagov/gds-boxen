class people::samjsharpe::repos {

    $home              = "/Users/${::luser}"
    $home_projects     = "${home}/Projects"

    file {[
        "${home_projects}/gds",
        "${home_projects}/hmrc",
        "${home_projects}/samjsharpe",
    ]:
        ensure => directory
    }

    # HMRC repos
    people::samjsharpe::repos::gh  {'hmrc/base-image-builder':}

    people::samjsharpe::repos::gds {[
        'hmrc/deployment',
        'hmrc/firewall-rule-generator',
        'hmrc/local-dev-vm',
        'hmrc/opsmanual',
        'hmrc/puppet',
        'hmrc/puppet-secrets',
        'hmrc/puppet-test',
        'hmrc/vcb',
        'hmrc/vcloud-config'
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

    people::samjsharpe::repos::gh  {[
        'alphagov/ci-puppet',
        'alphagov/boxgrinder-appliances',
        'alphagov/fabric-scripts',
        'alphagov/machine-bootstrap',
        'alphagov/service-domain-checker',
        'alphagov/ubuntu-1204-dev',
        'alphagov/vcloud-tools'
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
