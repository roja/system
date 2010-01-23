# System - System is a pure ruby interface to gather current systems information. #

## About ##

System is a pure ruby interface to gather systems information from the current host. System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem etc.

* Version 0.1.0 - Very basic information only

## GEM Installation ##

After this it should be just a gem to install. For those of you with old rubygems versions first:

    gem install gemcutter  # These two steps are only necessary if you haven't
    gem tumble             # yet installed the gemcutter tools

Otherwise and after it's simply:

	gem install system

Then your ready to rock and roll. :)

## Usage ##

Heres a few little examples of using system within your programs.

    require 'rubygems'
    require 'system'

    HostSystem::os => Current OS as a symbol i.e. :windows, :linux, :osx, :bsd

## Note on Patches/Pull Requests ##

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright ##

Copyright (c) 2010 Roja Buck. See LICENSE for details.
