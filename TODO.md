# TODO

## List

* Separate OS and Implementation specific logic into adapters
* * MRuby will need it's own C adapter because no ENV and no RUBY_PLATFORM which means no OS detection.
* `GraphicsAdapter 1-* Display`, `GraphicsAdapter 1-* GPU`, `GPU 1-* GPU::Core`
* `CPU 1-* CPU::Core`
* `System::OS.language` with `:iso_639`, and etc argument flags.

## System::CPU

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

## System::CPU::Core

```ruby
System::CPU[0].cores[0]          # => The first CPU's first core as a System::CPU::Core
System::CPU[0].cores[0].id       # => The ID of the first CPU's first core as an Integer
System::CPU[0].cores[0].flags    # => An Array containing the Core's flags as Symbols
System::CPU[0].cores[0].siblings # => An Array containing the other Cores in the CPU
```
