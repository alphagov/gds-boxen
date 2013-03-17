class sourcetree {
  package {'SourceTree':
    provider => 'appdmg',
    source   => 'http://downloads.atlassian.com/software/sourcetree/SourceTree_1.5.7.1.dmg',
  }
}
