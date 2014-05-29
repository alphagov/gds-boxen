class travis {
  ruby_gem {'travis for all rubies':
    gem          => 'travis',
    version      => '1.6.11',
    ruby_version => '*',
  }
}
