# System includes
require 'rbconfig'
require 'pathname'
require 'bundler/setup'
require 'version'

# Java includes - Have to load this way to avoid overloading of our classes
if /java/.match(RUBY_PLATFORM) # TODO: For now, this is a good place for this but it will need abstracting..
  require 'java'
  java_import java.lang.System
end

# Prepare LOAD_PATH
__LIB__ ||= Pathname.new(__FILE__).dirname
$:.unshift(__LIB__.to_s) unless $:.include?(__LIB__.to_s)

# System is a cross-platform and cross-implementation interface to gather system information from the current host.
# 
# System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem, etc..
# 
# @since 0.1.0
class System
  is_versioned
  
  class << self
    
    # Get the name of the operating system running on the current host.
    # 
    # Delegates to {System::OS.name} for backwards compatibility with 0.1.0.
    #
    # @return [Symbol] The name of the operating system.
    # @since 0.1.0
    # @deprecated 0.2.0
    # @see System::OS.name
    def os
      OS.name
    end
    alias_method :operating_system, :os
    
    # Check if Ruby is using Java.
    # 
    # Delegates to {System::Ruby.java?} for backwards compatibility with 0.1.0.
    #
    # @return [true, false] Is the current Ruby implementation using Java?
    # @since 0.1.0
    # @deprecated 0.2.0
    # @see System::Ruby.java?
    def java?
      Ruby.java?
    end
    
    # Check if Ruby is JRuby.
    # 
    # Delegates to {System::Ruby.jruby?} for backwards compatibility with 0.1.0.
    #
    # @return [true, false] Is the current Ruby implementation JRuby?
    # @since 0.1.0
    # @deprecated 0.2.0
    # @see System::Ruby.jruby?
    def jruby?
      Ruby.jruby?
    end
    
  end
end

# Constant for backwards compatibility with 0.1.0.
# @since 0.1.0
# @deprecated 0.2.0
# @see System
HostSystem = System

# Local includes
require 'system/cpu'
require 'system/os'
require 'system/ruby'
require 'system/screen'
require 'system/shell'
require 'system/terminal'
