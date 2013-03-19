class vagrant-dns {
  ruby::all::gem {'vagrant-dns':
    version => '0.2.4',
  }
  # vagrant-dns has a tacit dependency on daemons: 
  #   https://github.com/BerlinVagrant/vagrant-dns/issues/7
  ruby::all::gem {'daemons':
    version => '1.1.8',
  }
  ruby::all::gem {'rubydns':
    version => '0.4.1',
  }
}
