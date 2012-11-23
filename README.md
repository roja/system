# System

System is a pure ruby interface to gather current systems information.

## About

System is a cross-platform and cross-implementation interface to gather system information from the current host.

System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem, etc.

## Install

### Bundler: `gem 'system'`

### RubyGems: `gem install system`

## Usage

```ruby
require 'system'

System::Ruby.java?  # => Are we running on java?
System::Ruby.jruby? # => Are we running on jruby?
System::OS.name     # => Current OS name as a Symbol i.e. :windows, :linux, :osx, :bsd, :darwin, :solaris
System::CPU.count   # => Current number of CPUs, including individual cores
```

## TODO

### List

* Separate OS and Implementation specific logic into loadable mixins

    i.e. `require 'system/cpu'` would `require 'system/cpu/java'` if running JRuby.

* SPECS! Decide how to stub out system calls and replace with fixtures.

### System::OS

```ruby
System::OS.language # => The current OS's ISO 639 language code as a String
```

### System::CPU

```ruby
System::CPU[0].id                # => The first CPU's physical ID as an integer
System::CPU[0].vendor            # => The first CPU's vendor as a String
System::CPU[0].family            # => The first CPU's family as an Integer
System::CPU[0].model             # => The first CPU's model as an Integer
System::CPU[0].name              # => The first CPU's model as a String
System::CPU[0].speed             # => The first CPU's speed in MHz as a Float
System::CPU[0].cache             # => The first CPU's cache size in KB as an Integer
System::CPU[0].multi_core?       # => Does the first CPU contain multiple cores?
```

### System::CPU::Core

```ruby
System::CPU[0].cores[0]          # => The first CPU's first core as a System::CPU::Core
System::CPU[0].cores[0].id       # => The ID of the first CPU's first core as an Integer
System::CPU[0].cores[0].flags    # => An Array containing the Core's flags as Symbols
System::CPU[0].cores[0].siblings # => An Array containing the other Cores in the CPU
System::CPU[0].cores[0].siblings # => An Array containing the other Cores in the CPU
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

Copyright © 2009-2012 Roja Buck and Ryan Scott Lewis.

The MIT License (MIT) - See LICENSE for further details.
