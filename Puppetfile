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

github "boxen", "1.3.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.2.2"
github "homebrew", "1.1.2"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "1.1.0"
github "nodejs",   "1.0.0"
github "nvm",      "1.0.0"
github "ruby",     "3.0.0"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",          "1.1.0", :repo => "dieterdemeyer/puppet-adium"
github "caffeine",       "1.0.0"
github "chrome",         "1.1.0"
github "clipmenu",       "1.0.0", :repo => "jhubert/puppet-clipmenu"
github "clojure",        "1.2.0"
github "colloquy",       "1.0.0"
github "cord",           "1.0.0"
github "dropbox",        "1.1.0"
github "emacs",          "1.1.4", :repo => "bradleywright/puppet-emacs"
github "fitbit",         "1.0.0"
github "firefox",        "1.0.5"
github "flux",           "0.0.1", :repo => "technicalpickles/puppet-flux"
github "gitx",           "1.2.0"
github "jumpcut",        "1.0.0"
github "heroku",         "2.0.0"
github "intellij",       "1.1.2"
github "iterm2",         "1.0.2"
github "macvim",         "1.0.0"
github "mou",            "1.0.0"
github "mysql",          "1.0.0"
github "notational_velocity", "1.1.0"
github "ohmyzsh",        "1.0.0", :repo => "samjsharpe/puppet-ohmyzsh"
github "onepassword",    "1.0.0"
github "osx",            "1.0.0"
github "qt",             "1.0.0"
github "screen",         "1.0.0"
github "skype",          "1.0.2"
github "sparrow",        "1.0.0"
github "spf13vim3",      "1.0.0", :repo => "samjsharpe/puppet-spf13vim3"
github "spotify",        "1.0.0"
github "sublime_text_2", "1.1.0"
github "textmate",       "1.1.0"
github "things",         "1.0.0"
# github "vim",            "1.0.2"
github "wget",           "1.0.0"
github "xquartz",        "1.0.0"
github "zsh",            "1.0.0"
