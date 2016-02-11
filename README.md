# System

A library to easily gather information on the current system environment.

## About

System is a cross-platform and cross-implementation interface to gather system information from the current host.

System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem, etc.

## Install

### Bundler: `gem "system"`

### RubyGems: `gem install system`

## Usage

```ruby
require "system"

System::Ruby.java?  # => Are we running on java?
System::Ruby.jruby? # => Are we running on jruby?
System::OS.name     # => Current OS name as a Symbol i.e. :windows, :linux, :osx, :bsd, :darwin, :solaris
System::CPU.count   # => Current number of CPUs, including individual cores
```

###### Build Status

[![Build Status](https://secure.travis-ci.org/roja/system.png)](http://travis-ci.org/roja/system)

## Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start or switch to a testing/unstable/feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, VERSION or gemspec.

## Copyright

Copyright © 2009 System Gem Development Team

The MIT License (MIT) - See LICENSE for further details.
