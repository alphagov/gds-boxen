# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

forge "https://forge.puppetlabs.com"

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
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.11.1"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.7"
github "dnsmasq",     "2.0.2"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.11.0"
github "go",          "2.1.0"
github "homebrew",    "2.1.0"
github "hub",         "1.4.4"
github "inifile",     "1.4.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.7.0"
github "nodejs",      "5.0.9"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.4"
github "stdlib",      "4.7.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "adium",          "1.4.0", :repo => "dieterdemeyer/puppet-adium"
github "alfred",         "1.4.0"
github "antirsi",        "1.0.1", :repo => "norm/puppet-antirsi"
github "atom",           "1.2.0"
github "caffeine",       "1.0.0"
github "chrome",         "1.2.0"
github "clojure",        "1.3.0"
github "concat",         "2.1.0", :repo => "puppetlabs/puppetlabs-concat"
github "cups",           "1.4.1", :repo => "mosen/puppet-cups"
github "dropbox",        "1.4.1"
github "evernote",       "2.0.7"
github "firefox",        "1.2.3"
github "flux",           "1.0.1"
github "gitx",           "1.2.0"
github "googledrive",    "1.0.2", :repo => "gblair/puppet-googledrive"
github "intellij",       "1.5.1"
github "iterm2",         "1.2.4"
github "karabiner",      "1.0.7"
github "libreoffice",    "4.2.1", :repo => "alphagov/puppet-libreoffice"
github "macvim",         "1.0.0"
github "modern_space_cadet", "1.0.7"
github "mysql",          "2.0.1"
github "notational_velocity", "1.1.2"
github "ohmyzsh",        "1.0.0", :repo => "alphagov/puppet-ohmyzsh"
github "onepassword",    "1.1.5"
github "osx",            "2.8.0"
github "packer",         "1.3.0"
github "postgresql",     "3.0.3"                      # Note: this version installs postgresql 9.3.2
github "python",         "1.1.2", :repo => "alphagov/puppet-python"
github "qt",             "1.4.0.pre2"
github "screen",         "1.0.0"
github "sizeup",         "1.0.0"
github "skype",          "1.1.0"
github "slate",          "1.0.1"
github "sourcecodepro",  "1.0.0", :repo => "hugo/puppet-sourcecodepro"
github "sparrow",        "1.0.0"
github "spotify",        "1.0.2"
github "sublime_text_2", "1.1.2"
github "sublime_text_3", "1.0.3", :repo => "jozefizso/puppet-sublime_text_3"
github "sysctl",         "1.0.1"
github "textmate",       "1.1.0"
github "things",         "1.0.1"
github "vagrant",        "3.3.4"
github "vim",            "1.0.5"
github "virtualbox",     "1.0.10"
github "vmware_fusion",  "1.2.0"
github "wget",           "1.0.1"
github "zsh",            "1.0.0"
