## Getting started with Boxen

- Make sure you are running at least Mac OS X 10.8 (Mountain Lion)
- Install the full Xcode from the Mac App Store, and then explicitly install the Command Line Tools by running `xcode-select --install`
- Follow [these instructions][github-ssh-key] to generate an SSH key so that you can clone our repositories. You'll need to add your key to both github.com and github.gds, our GitHub Enterprise instance.
[github-ssh-key]: https://help.github.com/articles/generating-ssh-keys
### The following instructions will work for a fresh build or for an already set-up Mac.

    sudo mkdir -p /opt/boxen
    sudo chown ${USER}:admin /opt/boxen
    # For a fresh build you will need to add your ssh config
    # You will also need to ssh to git@github.gds and accept the host key
    git clone git@github.com:alphagov/gds-boxen.git /opt/boxen/repo
    cd /opt/boxen/repo

    # If your project directory is not /Users/$USER/govuk/ then use
    # PATH=... script/boxen --srcdir=/path/to/project/directory
    # For a fresh build, you will need to create /project/directory
    PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin script/boxen --srcdir=/Users/${USER}/govuk
    # add boxen to your shell config, at the end, eg.
    echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh' >> ~/.bashrc
    # or if you use ZSH
    echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh' >> ~/.zshrc

It should run successfully, and should tell you to source a shell script
in your environment. If it does not run successfully, and gives you
errors about unable to resolve `github.gds`, make sure you're on any of
the internal staff WiFi networks and can access `github.gds` in a web
browser and that you've sshed to `github.gds` as described above.

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

- To uninstall your homebrew you can run the following uninstall script:

        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

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
