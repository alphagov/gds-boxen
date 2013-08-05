# A class to install some things to make Vagrant work nicely without
# Virtualbox installed
class vagrant_no_vbox {
   file {'/usr/bin/VBoxManage':
        ensure  => file,
        mode    => '0755',
        owner   => 'root',
        group   => 'wheel',
        content => '#!/bin/bash
if [ "$1" == "--version" ]; then
    echo "4.2.16r86644"
fi
exit
',
   }
   file {'/usr/bin/vagrant':
        ensure  => file,
        mode    => '0755',
        owner   => 'root',
        group   => 'wheel',
        content => '#!/bin/bash
if [ "$1" == "up" ]; then
    exec /Applications/Vagrant/bin/vagrant "$@" --provider=vmware_fusion
else
    exec /Applications/Vagrant/bin/vagrant "$@"
fi
'
   }
}
