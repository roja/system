module System
  # Information about the current Ruby interpreter.
  #
  # @since 0.1.1
  module Ruby
    class << self
      # @method copyright
      # Get the current Ruby interpreter's copyright.
      #
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's copyright.
      # @example
      #   System::Ruby.copyright # => "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"

      # @method copyright?
      # Get whether the copyright exists.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.copyright  # => "ruby - Copyright (C) 1993-2012 Yukihiro Matsumoto"
      #   System::Ruby.copyright? # => true

      # @method description
      # Get the current Ruby interpreter's description which includes the engine, version, release date, revision, and platform.
      #
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's engine.
      # @example
      #   System::Ruby.description # => "ruby 1.9.3p327 (2012-11-10 revision 37606) [x86_64-darwin12.2.0]"

      # @method description?
      # Get whether the description exists.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.description  # => "ruby 1.9.3p327 (2012-11-10 revision 37606) [x86_64-darwin12.2.0]"
      #   System::Ruby.description? # => true

      # @method engine
      # Get the current Ruby interpreter's engine.
      #
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's engine.
      # @example
      #   System::Ruby.engine # => "ruby"

      # @method engine?
      # Get whether we have information about the engine.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.engine # => "ruby"
      #   System::Ruby.engine? # => true

      # @method patchlevel
      # Get the current Ruby interpreter's patch-level.
      #
      # @since 0.1.1
      # @return [Integer] The current Ruby interpreter's patch-level.
      # @example
      #   System::Ruby.patchlevel # => 286

      # @method patchlevel?
      # Get whether we have information about the patchlevel.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.patchlevel # => 286
      #   System::Ruby.patchlevel? # => true

      # @method platform
      # Get the system platform the current Ruby interpreter is running on.
      #
      # @since 0.1.1
      # @return [String] The system platform the current Ruby interpreter is running on.
      # @example
      #   System::Ruby.platform # => "x86_64-darwin12.2.0"

      # @method platform?
      # Get whether we have information about the platform.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.platform # => "x86_64-darwin12.2.0"
      #   System::Ruby.platform? # => true

      # @method revision
      # Get the current Ruby interpreter's revision.
      #
      # @since 0.1.1
      # @return [Integer] The current Ruby interpreter's revision.
      # @example
      #   System::Ruby.revision # => 37165

      # @method revision?
      # Get whether we have information about the revision.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.revision # => 37165
      #   System::Ruby.revision? # => true

      # @method release_date
      # Get the current Ruby interpreter's release date.
      #
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's release date.
      # @example
      #   System::Ruby.release_date # => "2012-10-12"

      # @method release_date?
      # Get whether we have information about the release_date.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.release_date # => "2012-10-12"
      #   System::Ruby.release_date? # => true

      # @method version
      # Get the current Ruby interpreter's version.
      #
      # @since 0.1.1
      # @return [String] The current Ruby interpreter's version.
      # @example
      #   System::Ruby.version # => "1.9.3"

      # @method version?
      # Get whether we have information about the version.
      #
      # @since 0.1.3
      # @return [true, false]
      # @example
      #   System::Ruby.version # => "1.9.3"
      #   System::Ruby.version? # => true

      [:copyright, :description, :engine, :patchlevel, :platform, :revision, :release_date, :version].each do |method_name|
        const_name = "RUBY_#{method_name.to_s.upcase}"

        define_method(method_name) do
          return nil unless Object.const_defined?(const_name)

          Object.const_get(const_name)
        end

        define_method("#{method_name}?") do
          !send(method_name).nil?
        end
      end

      INTERPRETERS = [:mri, :mruby, :jruby, :rubinius, :maglev].freeze

      # Get the current Ruby interpreter's name.
      #
      # @return [nil, Symbol] A symbol from the {INTERPRETERS} hash's values or nil if unknown.
      # @since 0.1.3
      def name
        return nil unless engine?

        name = engine.to_sym
        name = :rubinius if name == :rbx

        name
      end

      LANGUAGES = {
        c: [:ruby, :mruby],
        cpp: [:rubinius],
        java: [:jruby],
        smalltalk: [:maglev]
      }.freeze

      # Get the language the current Ruby interpreter was built in.
      #
      # @return [nil, Symbol] A symbol from the {LANGUAGES} hash's keys or nil if unknown.
      # @example MRI
      #   System::Ruby.language # => :c
      # @example JRuby
      #   System::Ruby.language # => :java
      # @since 0.1.3
      def language
        result = LANGUAGES.find { |_, interpreters| interpreters.include?(name) }

        result.nil? ? nil : result[0]
      end
    end
  end
end
