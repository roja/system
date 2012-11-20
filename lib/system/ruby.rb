require 'system'
require 'system/os'
require 'rubygems/platform'

class System
  
  # Information about the current Ruby interpreter.
  # 
  # @since 0.1.1
  module Ruby
    class << self
      
      # The C language.
      # @since 0.1.3
      C = :c
      
      # The C++ language.
      # @since 0.1.3
      CPlusPlus = :c_plus_plus
      
      # The Java language.
      # @since 0.1.3
      Java = :java
      
      # The Ruby interpreter: MRI.
      # @since 0.1.3
      MRI = :mri
      
      # The Ruby interpreter: JRuby.
      # @since 0.1.3
      JRuby = :jruby
      
      # The Ruby interpreter: Rubinius.
      # @since 0.1.3
      Rubinius = :rbx
      
      # The Ruby interpreter: MagLev.
      # @since 0.1.3
      MagLev = :maglev
      
      # @method copyright
      # Return the current Ruby interpreter's copyright.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's copyright.
      # @example
      #   System::Ruby.copyright # => "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"
      
      # @method copyright?
      # Return if we have information about the copyright.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.copyright  # => "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"
      #   System::Ruby.copyright? # => true
      
      # @method description
      # Return the current Ruby interpreter's description which includes the engine, version, 
      # release date, revision, and platform.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's engine.
      # @example
      #   System::Ruby.description # => "ruby 1.9.3p327 (2012-11-10 revision 37606) [x86_64-darwin12.2.0]"
      
      # @method description?
      # Return if we have information about the description.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.description  # => "ruby 1.9.3p327 (2012-11-10 revision 37606) [x86_64-darwin12.2.0]"
      #   System::Ruby.description? # => true
      
      # @method engine
      # Return the current Ruby interpreter's engine.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's engine.
      # @example
      #   System::Ruby.engine # => "ruby"
      
      # @method engine?
      # Return if we have information about the engine.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.engine # => "ruby"
      #   System::Ruby.engine? # => true
      
      # @method patchlevel
      # Return the current Ruby interpreter's patch-level.
      # 
      # @since 0.1.1
      # @return [Integer] The current Ruby interpreter's patch-level.
      # @example
      #   System::Ruby.patchlevel # => 286
      
      # @method patchlevel?
      # Return if we have information about the patchlevel.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.patchlevel # => 286
      #   System::Ruby.patchlevel? # => true
      
      # @method platform
      # Return the system platform the current Ruby interpreter is running on.
      # 
      # @since 0.1.1
      # @return [String] The system platform the current Ruby interpreter is running on.
      # @example
      #   System::Ruby.platform # => "x86_64-darwin12.2.0"
      
      # @method platform?
      # Return if we have information about the platform.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.platform # => "x86_64-darwin12.2.0"
      #   System::Ruby.platform? # => true
      
      # @method revision
      # Return the current Ruby interpreter's revision.
      # 
      # @since 0.1.1
      # @return [Integer] The current Ruby interpreter's revision.
      # @example
      #   System::Ruby.revision # => 37165
      
      # @method revision?
      # Return if we have information about the revision.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.revision # => 37165
      #   System::Ruby.revision? # => true
      
      # @method release_date
      # Return the current Ruby interpreter's release date.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's release date.
      # @example
      #   System::Ruby.release_date # => "2012-10-12"
      
      # @method release_date?
      # Return if we have information about the release_date.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.release_date # => "2012-10-12"
      #   System::Ruby.release_date? # => true
      
      # @method version
      # Return the current Ruby interpreter's version.
      # 
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's version.
      # @example
      #   System::Ruby.version # => "1.9.3"
      
      # @method version?
      # Return if we have information about the version.
      # 
      # @since 0.1.3
      # @return [TrueClass, FalseClass]
      # @example
      #   System::Ruby.version # => "2012-10-12"
      #   System::Ruby.version? # => true
      
      Object.constants.grep(/^RUBY_/).each do |const_name|
        method_name = const_name.to_s.gsub(/^RUBY_/, '').downcase.to_sym
        
        define_method(method_name) do
          Object.const_defined?(const_name) ? Object.const_get(const_name) : nil
        end
        
        define_method("#{method_name}?") { !send(method_name).nil? }
      end
      
      # Return the current Ruby interpreter's name.
      #
      # @return [Symbol] The name of the operating system.
      # @example Return OS name
      #   System::OS.name # => :osx
      # @example Assert current OS
      #   System::OS.name == System::OS::OSX # => true
      # @since 0.1.3
      def name
        @name ||= if !OS.windows? && ruby?
          MRI
        elsif ruby? && engine? && engine == 'rbx'
          Rubinius
        elsif ruby? && engine? && engine == 'maglev'
          MagLev
        elsif engine? && engine == 'jruby'
          JRuby
        end
      end
      
      # Return the current Ruby interpreter's base language.
      #
      # @return [Symbol] The name of the base language.
      # @example On MRI 1.9
      #   System::Ruby.language # => :ruby
      # @example On JRuby
      #   System::Ruby.language # => :java
      # @since 0.1.3
      def language
        @language ||= if %W[rbx maglev].any? { |name| engine == name }
          CPlusPlus
        elsif platform =~ /java/
          Java
        else
          C
        end
      end
      
      # Check if Ruby is using Java as it's base language.
      #
      # @return [TrueClass, FalseClass]
      # @since 0.1.1
      def java?
        language == Java
      end
      
      # Check if Ruby is using C or CPlusPlus as it's base language.
      #
      # @return [TrueClass, FalseClass]
      # @since 0.1.3
      def ruby?
        [C, CPlusPlus].any? { |language| self.language == language }
      end
      
      # Check if Ruby interpreter is JRuby.
      # Delegates to System::Ruby.jruby? for backwards compatibility.
      #
      # @return [TrueClass, FalseClass] Is the current Ruby interpreter JRuby?
      # @since 0.1.1
      def jruby?
        java? ? engine =~ /jruby/ : false
      end
      
    end
  end
end
