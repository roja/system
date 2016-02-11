module System
  module Helpers
    # Adds `.attribute` and `#update_attributes` methods.
    # Adds `.attribute` and `#update_attributes` methods.
    module HasAttributes
      # The class methods to extend into the object HasAttributes was included in.
      module ClassMethods
        # Define an attribute on the object.
        #
        # @example Simple accessor
        #   class User
        #     include Helpers::HasAttributes
        #
        #     attribute(:name)
        #   end
        #
        #   user = User.new
        #   user.name = "Ezio Auditore"
        #   user.name # => "Ezio Auditore"
        # @example Simple getter
        #   class User
        #     include Helpers::HasAttributes
        #
        #     attribute(:name, setter: false)
        #
        #     def initialize(name)
        #       @name = name
        #     end
        #   end
        #
        #   user = User.new("Ezio Auditore")
        #   user.name # => "Ezio Auditore"
        # @example Simple setter
        #   class User
        #     include Helpers::HasAttributes
        #
        #     attribute(:name, getter: false)
        #
        #     def name
        #       @name.strip
        #     end
        #   end
        #
        #   user = User.new
        #   user.name = "  Ezio Auditore  "
        #   user.name # => "Ezio Auditore"
        # @example Accessor with block
        #   class User
        #     include Helpers::HasAttributes
        #
        #     attribute(:name) { |value| value.to_s.strip }
        #   end
        #
        #   user = User.new
        #   user.name = "  Ezio Auditore  "
        #   user.name # => "Ezio Auditore"
        # @param [#to_sym] name The name of the attribute and instance variable.
        # @param [Hash, #to_hash] options The options for defining and passing to the block.
        # @option options [Boolean] :getter (true) Determines whether to define an attribute getter.
        # @option options [Boolean] :setter (true) Determines whether to define an attribute setter.
        # @yieldparam [Object] value The value given to the setter method.
        # @yieldparam [Hash] options The options given when defining, given to the setter method.
        # @yieldreturn [Object] The value to set the instance variable as.
        # @return [Object]
        def attribute(name, &block)
          name = name.to_sym

          options = options.to_h unless options.is_a?(Hash)
          options = { getter: true, setter: true }.merge(options)

          attr_reader(name) if options[:getter]

          define_method("#{name}=") do |value|
            value = instance_exec(value, options, &block) unless block.nil?

            instance_variable_set("@#{name}", value)
          end if options[:setter]

          self
        end
      end

      class << self
        # On include hook to extend `ClassMethods`.
        def included(base)
          base.send(:extend, ClassMethods)
        end
      end

      # Update attributes on this object.
      #
      # @example
      #   class User
      #     include Helpers::HasAttributes
      #
      #     attribute(:name) { |value| value.to_s.strip }
      #   end
      #
      #   user = User.new
      #   user.name # => nil
      #
      #   user.update_attributes(name: "  Ezio Auditore  ")
      #
      #   user.name # => "Ezio Auditore"
      # @example In `#initialize`
      #   class User
      #     include Helpers::HasAttributes
      #
      #     def initialize(attributes={})
      #       update_attributes(attributes)
      #     end
      #
      #     attribute(:name) { |value| value.to_s.strip }
      #   end
      #
      #   user = User.new(name: "  Ezio Auditore  ")
      #
      #   user.name # => "Ezio Auditore"
      # @param [Hash, #to_h] attributes
      # @return [Object]
      def update_attributes(attributes={})
        attributes.to_h.each { |name, value| send("#{name}=", value) }

        self
      end
    end
  end
end
