module System
  # Information about the current central processing units (CPUs) running on the current system.
  #
  # @since 0.1.1
  class CPU
    class << self
      # The CPU count of the system, including individual CPU cores.
      #
      # @return [Integer] Count of CPU cores.
      # @since 0.1.1
      def count
        return Java::Java.lang.Runtime.getRuntime.availableProcessors if System::Ruby.java?
        return File.read("/proc/cpuinfo").scan(/^processor\s*:/).size if File.exist?("/proc/cpuinfo")
        require "win32ole"
        WIN32OLE.connect("winmgmts://").ExecQuery("select * from Win32_ComputerSystem").NumberOfProcessors
      rescue LoadError
        Integer `sysctl -n hw.ncpu 2>/dev/null` rescue 1
      end
    end
  end
end
