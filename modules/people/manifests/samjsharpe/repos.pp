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

    people::samjsharpe::repos::gds {'hmrc/deployment':}
    people::samjsharpe::repos::gds {'hmrc/firewall-rule-generator':}
    people::samjsharpe::repos::gds {'hmrc/local-dev-vm':}
    people::samjsharpe::repos::gds {'hmrc/opsmanual':}
    people::samjsharpe::repos::gds {'hmrc/puppet':}
    people::samjsharpe::repos::gds {'hmrc/puppet-secrets':}
    people::samjsharpe::repos::gds {'hmrc/puppet-test':}
    people::samjsharpe::repos::gds {'hmrc/vcb':}
    people::samjsharpe::repos::gds {'hmrc/vcloud-config':}

    people::samjsharpe::repos::gds {'gds/deployment':}
    people::samjsharpe::repos::gds {'gds/development':}
    people::samjsharpe::repos::gds {'gds/env-sync-and-backup':}
    people::samjsharpe::repos::gds {'gds/opsmanual':}
    people::samjsharpe::repos::gds {'gds/private-utils':}
    people::samjsharpe::repos::gds {'gds/puppet':}

    people::samjsharpe::repos::gh  {'alphagov/ci-puppet':}
    people::samjsharpe::repos::gh  {'alphagov/boxgrinder-appliances':}
    people::samjsharpe::repos::gh  {'alphagov/fabric-scripts':}
    people::samjsharpe::repos::gh  {'alphagov/machine-bootstrap':}
    people::samjsharpe::repos::gh  {'alphagov/service-domain-checker':}
    people::samjsharpe::repos::gh  {'alphagov/ubuntu-1204-dev':}
    people::samjsharpe::repos::gh  {'alphagov/vcloud-tools':}

    people::samjsharpe::repos::gh  {'samjsharpe/fgaas':}
    people::samjsharpe::repos::gh  {'samjsharpe/samjsharpe.github.com':}
    people::samjsharpe::repos::gh  {'samjsharpe/vagrant-centos':}
    people::samjsharpe::repos::gh  {'samjsharpe/vagrant-rackspace':}
    people::samjsharpe::repos::gh  {'samjsharpe/vagrant-ubuntu':}

    people::samjsharpe::repos::gh  {'samjsharpe/dotfiles': notify => Exec['samjsharpe-link-my-dotfiles'] }
    exec {'samjsharpe-link-my-dotfiles':
      command     => "${home_projects}/samjsharpe/dotfiles/link.sh",
      refreshonly => true,
    }

}
