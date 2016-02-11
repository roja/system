require "system"
require "system/ruby"

module System
  # Information about the current Operating System (OS) running on the current system.
  #
  # @since 0.1.1
  class OS
    class << self
      # Inject the query methods for the OS names.
      def inherited(os)
        # Find all subclasses of OS
        # Define method "#{os.to_sym}?" on all subclasses

        # OS.instance_eval do
        #   define_method("#{os.name}?") { os.name == self }
        # end
      end
    end

    # Unknown OS
    # @since 0.1.1
    class Unknown < OS; end

    # Any Windows OS
    # @since 0.2.0
    class Windows < OS; end

    # Any UNIX OS
    # @since 0.2.0
    class UNIX < OS; end

    # Any Linux OS
    # @since 0.1.1
    class Linux < UNIX; end

    # Any Solaris OS
    # @since 0.1.1
    class Solaris < UNIX; end

    # Any BSD OS
    # @since 0.1.1
    class BSD < UNIX; end

    # Any Cygwin OS
    # @since 0.2.0
    class Cygwin < UNIX; end

    # Any AIX OS
    # @since 0.2.0
    class AIX < UNIX; end

    # Any IRIX OS
    # @since 0.2.0
    class IRIX < UNIX; end

    # Any HPUX OS
    # @since 0.2.0
    class HPUX < UNIX; end

    # Any NetBSD OS
    # @since 0.2.0
    class NetBSD < BSD; end

    # Any NetBSD OS
    # @since 0.2.0
    class FreeBSD < BSD; end

    # Any NetBSD OS
    # @since 0.2.0
    class OpenBSD < BSD; end

    # Any Darwin OS
    # @since 0.1.1
    class Darwin < BSD; end

    # Any OSX OS
    # @since 0.1.1
    class OSX < Darwin; end

    class << self
      # A list of all known subclasses of the OS.
      # When called on {OS}, this will return all known operating systems.
      #
      # @return [Array]
      # @since 0.2.0
      def list
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      # If {System::OS}, then use {OS.current} to get the name of the operating system
      # running on the current host. Otherwise, get the name of the current operating system.
      #
      # @return [Symbol] The name of the operating system.
      # @example Return OS name
      #   System::OS.name # => :osx
      # @example Assert current OS
      #   System::OS.name == System::OS::OSX # => true
      # @since 0.1.1
      def name
        self == OS ? current.to_sym :  to_sym
      end

      # @since 0.2.0
      # @return [Symbol]
      def to_sym
        to_s.split("::").last.downcase.to_sym
      end

      # @method linux?
      # Get if the name of the operating system is `System::OS::Linux`.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::OS.name # => :linux
      #   System::OS.linux? # => true

      # @method windows?
      # Get if the name of the operating system is `System::OS::Windows`.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::OS.name # => :windows
      #   System::OS.windows? # => true

      # @method solaris?
      # Get if the name of the operating system is `System::OS::Solaris`.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::OS.name # => :solaris
      #   System::OS.solaris? # => true

      # @method bsd?
      # Get if the name of the operating system is `System::OS::BSD`.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::OS.name # => :bsd
      #   System::OS.bsd? # => true

      # @method osx?
      # Get if the name of the operating system is `System::OS::OSX`.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::OS.name # => :osx
      #   System::OS.osx? # => true

      # @method darwin?
      # Get if the name of the operating system is `System::OS::Darwin`.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::OS.name # => :darwin
      #   System::OS.darwin? # => true

      def current
        return @current if defined?(@current)

        @current = case os_name
          when /linux/i then Linux
          when /solaris/i then Solaris
          when /netbsd/i then NetBSD
          when /freebsd/i then FreeBSD
          when /openbsd/i then OpenBSD
          when /aix/i then AIX
          when /irix/i then IRIX
          when /hpux/i then HPUX
          when /cygwin/i then Cygwin
          when /darwin/i then defined?(RbConfig::CONFIG) && RbConfig::CONFIG["build_vendor"] == "apple" ? OSX : Darwin
          when /mac.*?os.*?x/i then OSX
          when /win/i then Windows # TODO: "win" is in the word "darwin"... had to move down here but need better examples of Windows OS name results...
          else; Unknown
        end
      end

      private

      # Cross-platform way to retrieve the OS name.
      #
      # @return [String]
      def os_name
        return Ruby.platform if Ruby.platform?
        return RbConfig::CONFIG["host_os"] if defined?(RbConfig::CONFIG)
        return System.getProperty("os.name").downcase if System::Ruby.jruby? # FIXME: NoMethodError: undefined method `getProperty' for #<System:0x007fa1e29967f0>

        nil
      end
    end
  end
end
