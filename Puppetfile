# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.6.1"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.1"
github "foreman",    "1.2.0"
github "gcc",        "2.0.100"
github "git",        "2.3.1"
github "go",         "2.0.1"
github "handbrake",  "1.0.1"
github "homebrew",   "1.9.2"
github "hub",        "1.3.0"
github "inifile",    "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "java",       "1.5.0"
github "nginx",      "1.4.3"
github "nodejs",     "3.7.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.3.0"
github "pkgconfig",  "1.0.0"
github "repository", "2.3.0"
github "ruby",       "8.0.3"
github "stdlib",     "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",          "1.4.0", :repo => "dieterdemeyer/puppet-adium"
github "alfred",         "1.1.8"
github "android",        "1.2.1"
github "antirsi",        "1.0.1", :repo => "norm/puppet-antirsi"
github "atom",           "1.0.0"
github "banshee",        "1.1.0", :repo => "jabley/puppet-banshee"
github "caffeine",       "1.0.0"
github "camino",         "1.0.1", :repo => "norm/puppet-camino"
github "chrome",         "1.1.2"
github "clojure",        "1.2.0"
# need to specify an exact ref for concat or librarian-puppet barfs
# trying to parse the tag 1.0.0-rc1 into a version.
mod    "concat",         "1.0.0",
  :git => "git://github.com/puppetlabs/puppetlabs-concat.git",
  :ref => '1.0.0'
github "dropbox",        "1.2.0"
github "emacs",          "1.1.6", :repo => "bradleywright/puppet-emacs"
github "emacs_keybindings", "2.0.0", :repo => "bradleywright/puppet-emacs-keybindings"
github "evernote",       "2.0.6"
github "firefox",        "1.2.0"
github "flux",           "1.0.1"
github "github_for_mac", "1.4.0", :repo => "dieterdemeyer/puppet-github_for_mac"
github "gitx",           "1.2.0"
github "googledrive",    "1.0.2", :repo => "gblair/puppet-googledrive"
github "intellij",       "1.5.1"
github "istatmenus4",    "1.1.0"
github "iterm2",         "1.1.0"
github "keyremap4macbook", "1.2.2"
github "launchbar",      "1.2.0", :repo => "dieterdemeyer/puppet-launchbar"
github "libreoffice",    "4.2.1", :repo => "alphagov/puppet-libreoffice"
github "macvim",         "1.0.0"
github "monocle",        "1.0.0", :repo => "norm/puppet-monocle"
github "mou",            "1.1.3"
github "mplayerx",       "1.0.0", :repo => "geetarista/puppet-mplayerx"
github "mysql",          "1.2.0"
github "notational_velocity", "1.1.1"
github "ohmyzsh",        "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "omnifocus",      "1.0.1"
github "onepassword",    "1.1.0"
github "osx",            "2.5.0"
github "packer",         "1.2.1"
github "perl",           "1.1.0", :repo => "boxelly/puppet-perl"
github "propane",        "0.0.1", :repo => "technicalpickles/puppet-propane"
github "pycharm",        "1.0.4"
github "python",         "1.1.2", :repo => "alphagov/puppet-python"
github "qt",             "1.3.1"
github "rubymine",       "1.1.0"
github "screen",         "1.0.0"
github "sizeup",         "1.0.0"
github "slack",          "1.0.5"
github "skype",          "1.0.8"
github "slate",          "1.0.0"
github "sparrow",        "1.0.0"
github "spectacle",      "1.0.0"
github "spf13vim3",      "1.0.0", :repo => "samjsharpe/puppet-spf13vim3"
github "spotify",        "1.0.1"
github "stay",           "1.0.0", :repo => "bradleywright/puppet-stay"
github "sublime_text_2", "1.1.2"
github "sublime_text_3", "1.0.3", :repo => "jozefizso/puppet-sublime_text_3"
github "sysctl",         "1.0.1"
github "textmate",       "1.1.0"
github "transmission",   "1.1.0"
github "things",         "1.0.1"
github "unarchiver",     "1.4.0", :repo => "dieterdemeyer/puppet-unarchiver"
github "vagrant",        "3.0.9"
github "vim",            "1.0.5"
github "virtualbox",     "1.0.10"
github "vmware_fusion",  "1.1.0"
github "wget",           "1.0.1"
github "x_dispatch",     "2.0.0", :repo => "bradleywright/puppet-x-dispatch"
github "zsh",            "1.0.0"
