require 'system/version'

class System
  
  # Information about the current Ruby implementation.
  # 
  # @since 0.1.1
  module Ruby
    class << self
      
      # @method copyright
      # Return the current Ruby implementation's copyright.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby implementation's copyright.
      # @example
      #   System::Ruby.copyright # => "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"
      
      # @method description
      # Return the current Ruby implementation's description which includes the engine, version, 
      # release date, revision, and platform.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby implementation's engine.
      # @example
      #   System::Ruby.copyright # => "ruby"
      
      # @method engine
      # Return the current Ruby implementation's engine.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby implementation's engine.
      # @example
      #   System::Ruby.copyright # => "ruby"
      
      # @method patchlevel
      # Return the current Ruby implementation's patch-level.
      # 
      # @since 0.1.1
      # @return [Integer] The current Ruby implementation's patch-level.
      # @example
      #   System::Ruby.patchlevel # => 286
      
      # @method platform
      # Return the system platform the current Ruby implementation is running on.
      # 
      # @since 0.1.1
      # @return [String] The system platform the current Ruby implementation is running on.
      # @example
      #   System::Ruby.platform # => "x86_64-darwin12.2.0"
      
      # @method revision
      # Return the current Ruby implementation's revision.
      # 
      # @since 0.1.1
      # @return [Integer] The current Ruby implementation's revision.
      # @example
      #   System::Ruby.revision # => 37165
      
      # @method release_date
      # Return the current Ruby implementation's release date.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby implementation's release date.
      # @example
      #   System::Ruby.release_date # => "2012-10-12"
      
      # @method version
      # Return the current Ruby implementation's version.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby implementation's version.
      # @example
      #   System::Ruby.version # => "1.9.3"
      
      Object.constants.grep(/^RUBY_/).each do |const_name|
        method_name = const_name.to_s.gsub(/^RUBY_/, '').downcase.to_sym
        
        define_method(method_name) { Object.const_get(const_name) }
      end
      
      # Check if Ruby is using Java.
      # Delegates to System::Ruby.java? for backwards compatibility.
      #
      # @return [TrueClass, FalseClass] Is the current Ruby implementation using Java?
      # @since 0.1.1
      def java?
        !(/java/.match(platform).nil?)
      end
      
      # Check if Ruby is JRuby.
      # Delegates to System::Ruby.jruby? for backwards compatibility.
      #
      # @return [TrueClass, FalseClass] Is the current Ruby implementation JRuby?
      # @since 0.1.1
      def jruby?
        java? ? !!(/jruby/.match(engine)) : false
      end
      
    end
  end
end
