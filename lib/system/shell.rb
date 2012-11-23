require 'pathname'
require 'system'

class System
  
  # Information about the current Terminal's Shell.
  # 
  # @since 0.1.4
  module Shell
    
    class << self
      
      # @method path
      # Return the current Shell's PATH environment variable.
      # 
      # @since 0.1.4
      # @return [<String>, nil] The current Ruby interpreter's version.
      
      # @method path?
      # Return the current Shell's PATH environment variable is not nil.
      # 
      # @since 0.1.4
      # @return [true, false]
      # @example
      
      %W[PATH].each do |const_name|
        key_name = const_name.to_s.downcase.to_sym
        
        define_method(key_name) { ENV[key_name] }
        define_method("#{key_name}?") { !send(key_name).nil? }
      end
      
      # Determines if a shell command exists by searching for it in {#path}.
      # 
      # @return [true, false]
      # @since 0.1.4
      def command_exists?(command)
        return false unless path?
        path.split(File::PATH_SEPARATOR).any? { |d| Pathname.new(dir).join(command).exists? }
      end
      
    end
    
  end
  
end
