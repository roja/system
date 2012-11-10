# system includes
# require 'singleton'
require 'rbconfig'

# java includes
if /java/.match(RUBY_PLATFORM)
  require 'java'
  import 'java.lang.System'
end

# Note: Must be a Class for cross-implementation because System exists within JRuby
class System
  
  module OS
    
    # Constants for OS names:
    %w{Unknown Linux Windows Solaris BSD OSX Darwin}.each { |name| const_set(name, name.downcase.to_sym) }
    
    class << self
      
      def name
        return @name if defined?(@name)
        
        os_name = RUBY_PLATFORM
        os_name = RbConfig::CONFIG['host_os'] if defined?(RbConfig::CONFIG)
        os_name = System.getProperty('os.name').downcase if System::Ruby.jruby?
        
        @name = case os_name
        when /linux/ then Linux
        when /solaris/ then Solaris
        when /bsd/ then BSD
        when /darwin/ then
          defined?(RbConfig::CONFIG) && RbConfig::CONFIG['build_vendor'] == 'apple' ? OSX : Darwin
        when /mac.*?os.*?x/ then OSX
        when /win/ then Windows # TODO: "win" is in the word "darwin"... had to move down here but need better examples of Windows OS name results...
        else
          Unknown
        end
      end
      
    end
    
  end
  
  module Ruby
    class << self
      
      def java?
        !(/java/.match(RUBY_PLATFORM).nil?)
      end
      
      def jruby?
        java? ? /jruby/.match(RUBY_ENGINE) : false
      end
      
    end
  end
  
  class << self
    
    # Delegator for backwards compatibility
    def os
      System::OS.name
    end
    alias_method :operating_system, :os
    
  end
  
end

class System
  
  class CPU
    
    class << self
      
      def count
        return Java::Java.lang.Runtime.getRuntime.availableProcessors if System::Ruby.java? # defined? Java::Java
        return File.read('/proc/cpuinfo').scan(/^processor\s*:/).size if File.exist?('/proc/cpuinfo')
        require 'win32ole'
        WIN32OLE.connect("winmgmts://").ExecQuery("select * from Win32_ComputerSystem").NumberOfProcessors
      rescue LoadError
        Integer `sysctl -n hw.ncpu 2>/dev/null` rescue 1
      end
      
    end
    
  end
  
end

HostSystem = System # Backwards compatibility

p System::OS.name
p System::CPU.count