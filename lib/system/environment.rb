require "pathname"
require "system"

module System
  # Information about the current system environment.
  #
  # @since 0.2.0
  module Environment
    # Get whether the current environment contains environment variables or if an environment variable exists.
    #
    # @example MRI
    #   System::Environment.exist? # => true
    # @example MRuby
    #   System::Environment.exist? # => false
    # @param [nil, #to_s] name
    # @since 0.2.0
    def exist?(name=nil)
      return false unless Kernel.const_defined?(:ENV)

      name.nil? ? true : ENV[name.to_s.strip]
    end
    module_function :exist?

    # Get the current `PATH` environment variable.
    #
    # @return [nil, String]
    # @since 0.2.0
    def path
      return unless exist?

      ENV["PATH"]
    end
    module_function :path

    # Get whether the `PATH` environment variable exists.
    #
    # @return [Boolean]
    # @since 0.2.0
    def path?
      !path.nil?
    end
    module_function :path?

    # Get whether an executable exists by searching for it in the system `PATH` environment variable.
    #
    # @return [true, false]
    # @since 0.2.0
    def executable_exists?(command)
      return false unless path?

      path.split(":").any? { |_d| Pathname.new(dir).join(command).exists? }
    end
    module_function :executable_exists?
  end

  # Alias for {Environment}.
  #
  # @since 0.2.0
  Env = Environment
end
