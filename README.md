## Getting started with Boxen

- Install the Xcode Command Line Tools (full Xcode install optional).
- Run the following:

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:admin /opt/boxen
git clone git@github.com:alphagov/gds-boxen.git /opt/boxen/repo
cd /opt/boxen/repo
PATH=/usr/bin:/bin:/usr/sbin:/sbin script/boxen --srcdir=/Users/${USER}/govuk
# If you project directory is not /Users/$USER/govuk/ then use
# script/boxen --srcdir=/path/to/project/directory

# add boxen to your shell config, at the end, eg.
echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh'
```

Open a new terminal, `boxen --env` to confirm.

- Create a personal module to define what you want on your Mac
See [the documentation in the `modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone. You will probably want to:
 - `include somepackage` - see other users for details
 - `include projects::someproject` - for the projects you will work on
 - if `modules/teams/manifests/yourteam.pp` exists, you should `include teams::yourteam` to get shared team config

## What You Get by default

The following are provided by default:

* Homebrew
* Git
* Hub
* RBenv
* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* Ack
* Findutils
* GNU-Tar

## Further information about boxen

See [the rest of README.boxen](README.boxen.md)

