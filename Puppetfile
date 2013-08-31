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

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.1"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "java",       "1.1.2"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.0"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",          "1.1.1", :repo => "dieterdemeyer/puppet-adium"
github "banshee",        "1.1.0", :repo => "jabley/puppet-banshee"
github "antirsi",        "1.0.1", :repo => "norm/puppet-antirsi"
github "caffeine",       "1.0.0"
github "camino",         "1.0.1", :repo => "norm/puppet-camino"
github "chrome",         "1.1.1"
github "clojure",        "1.2.0"
github "colloquy",       "1.0.0"
# need to specify an exact ref for concat or librarian-puppet barfs
# trying to parse the tag 1.0.0-rc1 into a version.
mod    "concat",         "1.0.0",
  :git => "git://github.com/puppetlabs/puppetlabs-concat.git",
  :ref => '1.0.0'
github "controlplane",   "1.0.1", :repo => "dieterdemeyer/puppet-controlplane"
github "cord",           "1.0.0"
github "dropbox",        "1.1.1"
github "emacs",          "1.1.5", :repo => "bradleywright/puppet-emacs"
github "emacs-keybindings", "1.0.0", :repo => "bradleywright/puppet-emacs-keybindings"
github "evernote",       "2.0.4"
github "firefox",        "1.1.1"
github "fitbit",         "1.0.0"
github "flux",           "1.0.0"
github "github_for_mac", "1.2.0", :repo => "dieterdemeyer/puppet-github_for_mac"
github "gitx",           "1.2.0"
github "googledrive",    "1.0.2", :repo => "gblair/puppet-googledrive"
github "heroku",         "2.0.0"
github "intellij",       "1.3.0"
github "istatmenus4",    "1.0.0"
github "iterm2",         "1.0.3"
github "launchbar",      "1.1.0", :repo => "dieterdemeyer/puppet-launchbar"
github "libreoffice",    "4.0.3", :repo => "jasonamyers/puppet-libreoffice"
github "macvim",         "1.0.0"
github "monocle",        "0.0.2", :repo => "norm/puppet-monocle"
github "mou",            "1.1.3"
github "mplayerx",       "1.0.0", :repo => "geetarista/puppet-mplayerx"
github "mysql",          "1.1.3"
github "notational_velocity", "1.1.1"
github "ohmyzsh",        "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "onepassword",    "1.0.2"
github "osx",            "1.6.0"
github "postgresql",     "2.0.0"
github "propane",        "0.0.1", :repo => "technicalpickles/puppet-propane"
github "property_list_key", "0.1.0", :repo => "glarizza/puppet-property_list_key"
github "pycharm",        "1.0.3"
github "qt",             "1.0.0"
github "rubymine",       "1.0.2"
github "screen",         "1.0.0"
github "sizeup",         "1.0.0"
github "skype",          "1.0.3"
github "slate",          "1.0.0"
github "sparrow",        "1.0.0"
github "spectacle",      "1.0.0"
github "spf13vim3",      "1.0.0", :repo => "samjsharpe/puppet-spf13vim3"
github "spotify",        "1.0.1"
github "stay",           "1.0.0", :repo => "bradleywright/puppet-stay"
github "sublime_text_2", "1.1.2"
github "sysctl",         "1.0.0"
github "textmate",       "1.1.0"
github "things",         "1.0.1"
github "unarchiver",     "1.1.0", :repo => "dieterdemeyer/puppet-unarchiver"
github "vagrant",        "2.0.10"
github "vim",            "1.0.5"
github "vmware_fusion",  "1.0.0"
github "wget",           "1.0.0"
github "zsh",            "1.0.0"
