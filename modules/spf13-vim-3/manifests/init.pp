class spf13-vim-3 {
  exec {'install-spf13-vim-3':
    command => 'curl http://j.mp/spf13-vim3 -L | bash -s',
    creates => "/Users/${::luser}/.spf13-vim-3"
  }
}
