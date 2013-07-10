# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Core modules for a basic development environment. You can replace
# some/most of those if you want, but it's not recommended.

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "2.3.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "gcc",        "1.0.0"
github "git",        "1.2.4"
github "homebrew",   "1.1.2"
github "hub",        "1.0.0"
github "inifile",    "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "java",       "1.1.0"
github "nginx",      "1.1.0"
github "nodejs",     "1.0.0"
github "nvm",        "1.0.0"
github "repository", "2.2.0"
github "ruby",       "4.1.0"
github "stdlib",     "4.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",          "1.1.0", :repo => "dieterdemeyer/puppet-adium"
github "antirsi",        "1.0.1", :repo => "norm/puppet-antirsi"
github "caffeine",       "1.0.0"
github "camino",         "1.0.1", :repo => "norm/puppet-camino"
github "chrome",         "1.1.0"
github "clojure",        "1.2.0"
github "colloquy",       "1.0.0"
github "cord",           "1.0.0"
github "dropbox",        "1.1.0"
github "emacs",          "1.1.4", :repo => "bradleywright/puppet-emacs"
github "firefox",        "1.0.5"
github "fitbit",         "1.0.0"
github "flux",           "0.0.1"
github "github_for_mac", "1.2.0", :repo => "dieterdemeyer/puppet-github_for_mac"
github "gitx",           "1.2.0"
github "googledrive",    "1.0.1", :repo => "gblair/puppet-googledrive"
github "heroku",         "2.0.0"
github "intellij",       "1.1.2"
github "iterm2",         "1.0.2"
github "launchbar",      "1.1.0", :repo => "dieterdemeyer/puppet-launchbar"
github "libreoffice",    "1.0.0", :repo => "jasonamyers/puppet-libreoffice"
github "macvim",         "1.0.0"
github "monocle",        "0.0.2", :repo => "norm/puppet-monocle"
github "mou",            "1.0.0"
github "mplayerx",       "1.0.0", :repo => "geetarista/puppet-mplayerx"
github "mysql",          "1.0.0"
github "notational_velocity", "1.1.0"
github "ohmyzsh",        "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "onepassword",    "1.0.0"
github "osx",            "1.1.0"
github "postgresql",     "1.0.0"
github "propane",        "0.0.1", :repo => "technicalpickles/puppet-propane"
github "property_list_key", "0.1.0", :repo => "glarizza/puppet-property_list_key"
github "pycharm",        "1.0.1"
github "qt",             "1.0.0"
github "rubymine",       "1.0.1"
github "screen",         "1.0.0"
github "skype",          "1.0.2"
github "slate",          "1.0.0"
github "sparrow",        "1.0.0"
github "spf13vim3",      "1.0.0", :repo => "samjsharpe/puppet-spf13vim3"
github "spotify",        "1.0.0"
github "sublime_text_2", "1.1.0"
github "sysctl",         "1.0.0"
github "textmate",       "1.1.0"
github "things",         "1.0.0"
github "unarchiver",     "1.0.0", :repo => "dieterdemeyer/puppet-unarchiver"
github "vagrant",        "2.0.7"
github "vim",            "1.0.3"
github "vmware_fusion",  "1.0.0"
github "wget",           "1.0.0"
github "xquartz",        "1.0.0"
github "zsh",            "1.0.0"
