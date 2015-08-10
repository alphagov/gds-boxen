class people::jabley::repos {

  file {[
    "${people::jabley::home_projects}/BerlinVagrant",
    "${people::jabley::home_projects}/ChrisWeiss",
    "${people::jabley::home_projects}/JordanHatch",
    "${people::jabley::home_projects}/MastodonC",
    "${people::jabley::home_projects}/TalentBox",
    "${people::jabley::home_projects}/applicake",
    "${people::jabley::home_projects}/archiloque",
    "${people::jabley::home_projects}/capistrano",
    "${people::jabley::home_projects}/camlistore",
    "${people::jabley::home_projects}/cdaniel",
    "${people::jabley::home_projects}/circonus-labs",
    "${people::jabley::home_projects}/clojure",
    "${people::jabley::home_projects}/coreos",
    "${people::jabley::home_projects}/datagovuk",
    "${people::jabley::home_projects}/django",
    "${people::jabley::home_projects}/elasticsearch",
    "${people::jabley::home_projects}/etsy",
    "${people::jabley::home_projects}/fullstackio",
    "${people::jabley::home_projects}/garethr",
    "${people::jabley::home_projects}/gds-operations",
    "${people::jabley::home_projects}/jabley",
    "${people::jabley::home_projects}/jberkel",
    "${people::jabley::home_projects}/jekyll",
    "${people::jabley::home_projects}/jenkinsci",
    "${people::jabley::home_projects}/jeremyevans",
    "${people::jabley::home_projects}/jnunemaker",
    "${people::jabley::home_projects}/joyent",
    "${people::jabley::home_projects}/karmi",
    "${people::jabley::home_projects}/kelseyhightower",
    "${people::jabley::home_projects}/kohsuke",
    "${people::jabley::home_projects}/mitchellh",
    "${people::jabley::home_projects}/mitsuhiko",
    "${people::jabley::home_projects}/mozilla-services",
    "${people::jabley::home_projects}/mustache",
    "${people::jabley::home_projects}/mysociety",
    "${people::jabley::home_projects}/nex3",
    "${people::jabley::home_projects}/nginx",
    "${people::jabley::home_projects}/omniti-labs",
    "${people::jabley::home_projects}/openregister",
    "${people::jabley::home_projects}/piwik",
    "${people::jabley::home_projects}/plataformatec",
    "${people::jabley::home_projects}/rails",
    "${people::jabley::home_projects}/real-logic",
    "${people::jabley::home_projects}/revel",
    "${people::jabley::home_projects}/robyoung",
    "${people::jabley::home_projects}/rodjek",
    "${people::jabley::home_projects}/ruby",
    "${people::jabley::home_projects}/songkick",
    "${people::jabley::home_projects}/steinim",
    "${people::jabley::home_projects}/thattommyhall",
    "${people::jabley::home_projects}/varnish",
    "${people::jabley::home_projects}/visionmedia",
    ]:
    ensure => directory,
  }

  define github ($host = "github.com", $ensure = "present", $path = undef) {
    $dirs = split($title, '/')

    $dir = $dirs[0]
    $repo = $dirs[1]
    $source = $title

    if $path {
        repository { "${people::jabley::home_projects}/${title}":
            ensure  => $ensure,
            source  => "git@${host}:${source}",
            path    => "${people::jabley::home_projects}/${dir}/${path}",
            require => File["${people::jabley::home_projects}/${dir}"],
        }        
    } else {
        repository { "${people::jabley::home_projects}/${title}":
            ensure  => $ensure,
            source  => "git@${host}:${source}",
            require => File["${people::jabley::home_projects}/${dir}"],
        }
    }
  }

  github {
    'jabley/mustache':
    path => 'go-mustache',
  }

  github {
    'jabley/progfun-2012':
    path => 'jabley-progfun-2012',
  }

  github {
    'jabley/spec':
    path => 'mustache-spec',
  }

  github {[
    'BerlinVagrant/vagrant-dns',
    'ChrisWeiss/vagrant-ubuntu-precise-32-desktop',
    'JordanHatch/bowler',
    'MastodonC/nhs-prescription-analytics',
    'TalentBox/sequel-rails',
    'applicake/doorkeeper',
    'archiloque/rest-client',
    'camlistore/camlistore',
    'capistrano/capistrano',
    'cdaniel/wardleymapstool',
    'circonus-labs/fq',
    'circonus-labs/libmtev',
    'clojure/clojure',
    'coreos/coreos-vagrant',
    'datagovuk/standards.data.gov.uk',
    'django/django',
    'elasticsearch/logstash-forwarder',
    'etsy/statsd',
    'fullstackio/FlappySwift',
    'garethr/jruby-embedded-jetty',
    'gds-operations/puppet-module-skeleton',
    'jabley/PinDroid',
    'jabley/activerecord-import',
    'jabley/alternativebp.com',
    'jabley/anthology',
    'jabley/bcrypt-ruby',
    'jabley/bloog',
    'jabley/bob-walker',
    'jabley/campfire-plugin',
    'jabley/capybara',
    'jabley/confnotes.club',
    'jabley/data-anonymization',
    'jabley/elasticsearch',
    'jabley/elephantdb',
    'jabley/forcomp',
    'jabley/fpinscala-exercises',
    'jabley/gmail-britta',
    'jabley/gojsonschema',
    'jabley/golang-challenge-1',
    'jabley/gom',
    'jabley/homebrew',
    'jabley/jargone',
    'jabley/markdown',
    'jabley/netty',
    'jabley/performance-node-frontend',
    'jabley/progfun',
    'jabley/puppet-shelf',
    'jabley/puppet',
    'jabley/requests',
    'jabley/spdy',
    'jabley/stripe-ctf-2.0',
    'jabley/third_party.go',
    'jabley/train',
    'jberkel/sms-backup-plus',
    'jekyll/jekyll',
    'jenkinsci/jenkins',
    'jeremyevans/sequel',
    'jnunemaker/canable',
    'jnunemaker/httparty',
    'joyent/node',
    'karmi/tire',
    'kelseyhightower/coreos-ops-tutorial',
    'kohsuke/file-leak-detector',
    'mitchellh/vagrant',
    'mitsuhiko/flask',
    'mitsuhiko/werkzeug',
    'mozilla-services/heka',
    'mustache/mustache',
    'mysociety/mapit',
    'nex3/sass',
    'nginx/nginx',
    'omniti-labs/reconnoiter',
    'openregister/register',
    'piwik/piwik',
    'plataformatec/devise',
    'rails/protected_attributes',
    'rails/rails',
    'rails/sass-rails',
    'real-logic/Aeron',
    'revel/revel',
    'robyoung/http2play',
    'rodjek/librarian-puppet',
    'ruby/ruby',
    'songkick/transport',
    'steinim/zero-downtime-ansible',
    'thattommyhall/offline-4clojure',
    'varnish/Varnish-Cache',
    'visionmedia/express',
    ]:
  }
}
