require "system/helpers/has_attributes"

module System
  # The dimensions for a display or shell size.
  #
  # @since 0.2.0
  class Dimensions
    include Helpers::HasAttributes

    # @param [#to_h] attributes
    # @since 0.2.0
    def initialize(attributes={})
      @width = 0
      @height = 0

      update_attributes(attributes)
    end

    # @method width
    # Get the width in pixels.
    #
    # @return [Integer]
    # @since 0.2.0

    # @method width=
    # Set the width in pixels.
    #
    # @param [#to_i] value
    # @return [Integer]
    # @since 0.2.0
    attribute(:width) { |value| value.to_i }

    # @method height
    # Get the height in pixels.
    #
    # @return [Integer]
    # @since 0.2.0

    # @method height=
    # Set the height in pixels.
    #
    # @param [#to_i] value
    # @return [Integer]
    # @since 0.2.0
    attribute(:height) { |value| value.to_i }

    # Convert to a String.
    #
    # @return [String]
    # @since 0.2.0
    def to_s
      "#{@width}x#{@height}"
    end

    # Convert to an Array.
    #
    # @return [<Integer>]
    # @since 0.2.0
    def to_a
      [@width, @height]
    end

    # Convert to a Hash.
    #
    # @return [{ Symbol => Integer }]
    # @since 0.2.0
    def to_h
      { width: @width, height: @height }
    end
  end
end
