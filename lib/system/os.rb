require 'system'

class System
  
  # Information about the current Operating System (OS) running on the current system.
  # 
  # @since 0.1.1
  module OS
    
    # Unknown OS
    # @since 0.1.1
    Unknown = :unknown
    
    # Any OS running the Linux kernel
    # @since 0.1.1
    Linux = :linux
    
    # Any Windows OS
    # @since 0.1.1
    Windows = :windows
    
    # Any Solaris OS
    # @since 0.1.1
    Solaris = :solaris
    
    # Any OS running the BSD kernel
    # @since 0.1.1
    BSD = :bsd
    
    # Any OSX OS
    # @since 0.1.1
    OSX = :osx
    
    # Any OS running the Darwin kernel
    # @since 0.1.1
    Darwin = :darwin
    
    class << self
      
      # Get the name of the operating system running on the current host.
      #
      # @return [Symbol] The name of the operating system.
      # @example Return OS name
      #   System::OS.name # => :osx
      # @example Assert current OS
      #   System::OS.name == System::OS::OSX # => true
      # @since 0.1.1
      def name
        return @name if defined?(@name)
        
        os_name = System::Ruby.platform
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
end
