require 'system/version'

class System
  class << self
    
    # Get the name of the operating system running on the current host.
    # 
    # Delegates to System::OS.name for backwards compatibility with 0.1.0.
    #
    # @return [Symbol] The name of the operating system.
    # @since 0.1.0
    def os
      System::OS.name
    end
    alias_method :operating_system, :os
    
    # Check if Ruby is using Java.
    # 
    # Delegates to System::Ruby.java? for backwards compatibility with 0.1.0.
    #
    # @return [TrueClass, FalseClass] Is the current Ruby implementation using Java?
    # @since 0.1.0
    def java?
      System::Ruby.java?
    end
    
    # Check if Ruby is JRuby.
    # 
    # Delegates to System::Ruby.jruby? for backwards compatibility with 0.1.0.
    #
    # @return [TrueClass, FalseClass] Is the current Ruby implementation JRuby?
    # @since 0.1.0
    def jruby?
      System::Ruby.jruby?
    end
    
  end
end

# Constant for backwards compatibility with 0.1.0.
# @since 0.1.0
HostSystem = System
