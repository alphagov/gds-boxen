define alphagov::repo {
  repository { "${boxen::config::srcdir}/${title}":
    # this is a nasty nasty hack around the puppet-repository defined
    # type. The regex used to detect whether the repo needs to be qualified
    # is /\A\S+\/\S+\z/ which will match git@github.com:alphagov/$title and
    # will try to prepend https://github.com/ to it - which is wrong. By
    # starting my repo with a ' ' it is still valid for the git clone but
    # fails the regex. I hate myself.
    # https://github.com/boxen/puppet-repository/blob/master/lib/puppet/provider/repository/git.rb#LC55
    source   => " git@github.com:alphagov/${title}",
  }
}
