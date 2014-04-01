## Getting started with Boxen

- Make sure you are running Mac OS X 10.8 (Mountain Lion)
- Install the full Xcode from the Mac App Store, and then explicitly install the Command Line Tools (Open Xcode -> Preferences -> Downloads -> Install Command Line Tools). You may instead be able to use the [standalone Xcode Command Line Tools][xcode-cli] rather than installing it through the full Xcode, but this has caused some issues and [Boxen's README][boxen-readme] recommends using the full Xcode. If you are using the standalone version, you may also need to run `sudo xcode-select --switch /path/to/xcode`.
[xcode-cli]: https://developer.apple.com/downloads/index.action
[boxen-readme]: https://github.com/boxen/our-boxen/blob/master/README.md#getting-started

### The following instructions will work for a fresh build or for an already set-up Mac.

    sudo mkdir -p /opt/boxen
    sudo chown ${USER}:admin /opt/boxen
    # For a fresh build you will need to add your ssh config
    git clone git@github.com:alphagov/gds-boxen.git /opt/boxen/repo
    cd /opt/boxen/repo

    # If your project directory is not /Users/$USER/govuk/ then use
    # PATH=... script/boxen --srcdir=/path/to/project/directory
    # For a fresh build, you will need to create /project/directory
    PATH=/usr/bin:/bin:/usr/sbin:/sbin script/boxen --srcdir=/Users/${USER}/govuk
    # add boxen to your shell config, at the end, eg.
    echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh' >> ~/.bashrc
    # or if you use ZSH
    echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh' >> ~/.zshrc

See [the rest of README.boxen](README.boxen.md)
