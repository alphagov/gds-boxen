## Getting started with Boxen

- Make sure you are running Mac OS X 10.8 (Mountain Lion)
- Install the full Xcode from the Mac App Store, and then explicitly install the Command Line Tools (Open Xcode -> Preferences -> Downloads -> Install Command Line Tools). You may instead be able to use the [standalone Xcode Command Line Tools][xcode-cli] rather than installing it through the full Xcode, but this has caused some issues and [Boxen's README][boxen-readme] recommends using the full Xcode. If you are using the standalone version, you may also need to run `sudo xcode-select --switch /path/to/xcode`.
[xcode-cli]: https://developer.apple.com/downloads/index.action
[boxen-readme]: https://github.com/boxen/our-boxen/blob/master/README.md#getting-started
- Follow [these instructions][github-ssh-key] to generate an SSH key so that you can clone our repositories. 
[github-ssh-key]: https://help.github.com/articles/generating-ssh-keys
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

It should run successfully, and should tell you to source a shell script
in your environment.
For users without a bash or zsh config or a `~/.profile` file,
Boxen will create a shim for you that will work correctly.
If you do have a `~/.bashrc` or `~/.zshrc`, your shell will not use
`~/.profile` so you'll need to add a line like so at _the end of your config_:

``` sh
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
```

Once your shell is ready, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.


- Create a personal module to define what you want on your Mac. See [the
  documentation in the `modules/people`](modules/people/README.md) directory for
  creating per-user modules that don't need to be applied globally to everyone.
  You will probably want to:
  - `include somepackage` - see other users' personal modules for details
  - `include projects::someproject` - for the projects you will work on
  - if `modules/teams/manifests/yourteam.pp` exists, you should `include
    teams::yourteam` to get shared team config
  - After you have created your module, run `boxen`. This will set your Mac up as requested. (You do not need to have pushed to GitHub for this to work.)

## Removing install of Homebrew in /usr/local/bin for an already set-up Mac.

- Boxen installs its own version of Homebrew in `/opt/boxen/homebrew` which may
  conflict with a previous version installed in `/usr/local/bin`.
- You can list the brews installed in your previous version with:

        /usr/local/bin/brew list

- You can list the brews installed by Boxen with:

        /opt/boxen/homebrew/bin/brew list

- To generate a list of previous homebrew builds (to add to
  `modules/people/manifests/yourgithubuser.pp`) you can do:

        /usr/local/bin/brew list | (
            echo "package { ["
            while read line; do
                echo "           '$line',"
            done
            echo "          ]:"
            echo "          ensure => 'present',"
            echo "}"
        )

- One you have installed your previous brews with Boxen (run the `boxen` command
  after adding the resource generated above) you can [delete the previous
  homebrew](https://gist.github.com/mxcl/1173223)

## What you get by default

The following are provided by default:

* Homebrew
* Git
* Hub
* rbenv
* Full Disk Encryption requirement
* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* Ruby 2.0.0
* ack
* Findutils
* GNU tar

## Further information about boxen

See [the rest of README.boxen](README.boxen.md)
