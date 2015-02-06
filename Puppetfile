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

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "2.0.0"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.1"
github "go",          "2.1.0"
github "handbrake",   "1.0.1"
github "homebrew",    "1.9.8"
github "hub",         "1.3.0"
github "inifile",     "1.1.3", :repo => "puppetlabs/puppetlabs-inifile"
github "java",        "1.7.0"
github "nginx",       "1.4.3"
github "nodejs",      "4.0.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.4"
github "stdlib",      "4.3.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",          "1.4.0", :repo => "dieterdemeyer/puppet-adium"
github "alfred",         "1.3.1"
github "android",        "1.3.0"
github "antirsi",        "1.0.1", :repo => "norm/puppet-antirsi"
github "atom",           "1.0.0"
github "banshee",        "1.1.0", :repo => "jabley/puppet-banshee"
github "brewcask",       "0.0.4"
github "caffeine",       "1.0.0"
github "camino",         "1.0.1", :repo => "norm/puppet-camino"
github "chrome",         "1.2.0"
github "clojure",        "1.3.0"
github "concat",         "1.0.0", :repo => "puppetlabs/puppetlabs-concat"
github "dropbox",        "1.4.0"
github "emacs",          "1.1.6", :repo => "bradleywright/puppet-emacs"
github "emacs_keybindings", "2.0.0", :repo => "bradleywright/puppet-emacs-keybindings"
github "evernote",       "2.0.6"
github "firefox",        "1.2.3"
github "flux",           "1.0.1"
github "github_for_mac", "1.4.0", :repo => "dieterdemeyer/puppet-github_for_mac"
github "gitx",           "1.2.0"
github "googledrive",    "1.0.2", :repo => "gblair/puppet-googledrive"
github "intellij",       "1.5.1"
github "istatmenus4",    "1.1.0"
github "iterm2",         "1.2.2"
github "karabiner",      "1.0.6"
github "launchbar",      "1.2.0", :repo => "dieterdemeyer/puppet-launchbar"
github "libreoffice",    "4.2.1", :repo => "alphagov/puppet-libreoffice"
github "macvim",         "1.0.0"
github "modern_space_cadet", "1.0.7"
github "monocle",        "1.0.0", :repo => "norm/puppet-monocle"
github "mou",            "1.1.3"
github "mplayerx",       "1.0.0", :repo => "geetarista/puppet-mplayerx"
github "mysql",          "1.2.2"
github "notational_velocity", "1.1.2"
github "ohmyzsh",        "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "omnifocus",      "1.1.0"
github "onepassword",    "1.1.5"
github "osx",            "2.7.1"
github "packer",         "1.3.0"
github "perl",           "1.1.0", :repo => "boxelly/puppet-perl"
github "propane",        "0.0.1", :repo => "technicalpickles/puppet-propane"
github "pycharm",        "1.0.4"
github "python",         "1.1.2", :repo => "alphagov/puppet-python"
github "qt",             "1.3.1"
github "rubymine",       "1.1.0"
github "screen",         "1.0.0"
github "seil",           "1.0.3"
github "sizeup",         "1.0.0"
github "skype",          "1.0.9"
github "slate",          "1.0.1"
github "sourcecodepro",  "1.0.0", :repo => "thisishugo/puppet-sourcecodepro"
github "sparrow",        "1.0.0"
github "spectacle",      "1.0.0"
github "spf13vim3",      "1.0.0", :repo => "samjsharpe/puppet-spf13vim3"
github "spotify",        "1.0.2"
github "stay",           "1.0.0", :repo => "bradleywright/puppet-stay"
github "sublime_text_2", "1.1.2"
github "sublime_text_3", "1.0.3", :repo => "jozefizso/puppet-sublime_text_3"
github "sysctl",         "1.0.1"
github "textmate",       "1.1.0"
github "transmission",   "1.1.0"
github "things",         "1.0.1"
github "unarchiver",     "1.5.0", :repo => "dieterdemeyer/puppet-unarchiver"
github "vagrant",        "3.2.0"
github "vim",            "1.0.5"
github "virtualbox",     "1.0.10"
github "vmware_fusion",  "1.2.0"
github "wget",           "1.0.1"
github "x_dispatch",     "2.0.0", :repo => "bradleywright/puppet-x-dispatch"
github "zsh",            "1.0.0"
