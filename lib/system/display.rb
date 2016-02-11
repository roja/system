require "system/helpers/has_attributes"
require "system/os"
require "system/dimensions"

module System
  # Information about the computer's attached display(s).
  #
  # @since 0.2.0
  class Display
    class << self
      # Get all displays attached to the current host.
      #
      # @return [<Display>]
      # @since 0.2.0
      def all
        # TODO
      end

      # The current host's primary Display.
      #
      # @return [Display]
      # @since 0.2.0
      def primary
        instance = new

        if OS.windows? # NOTE: http://stackoverflow.com/a/4631379/139089
          require "dl/import"
          require "dl/struct"

          user32 = DL.dlopen("user32")
          get_system_metrics = user32["GetSystemMetrics", "ILI"]

          instance.width = get_system_metrics.call(0, 0)
          instance.height = get_system_metrics.call(1, 0)
        elsif OS.darwin? # TODO: Move into DisplayAdapter This whole method should just be `DisplayAdapter.first.displays.first`
          # require "yaml"
          #
          # display_data = YAML.load(`system_profiler SPDisplaysDataType`)["Graphics/Displays"]
          # displays = display_data.each_with_object([]) do |graphics_cards, memo|
          #   graphics_cards.each do |graphics_card|
          #     # TODO:
          #     #  System::GraphicsAdapter
          #     #  AKA video adapter, display card, graphics card, graphics board, display adapter, graphics adapter (dunno what to name it)
          #     #  System::GPU
          #     graphics_card["Displays"].collect do |display|
          #       display[1]["Resolution"]
          #     end
          #   end
          # end.flatten

          width, height = resolutions.first.scan(/(\d+) x (\d+)/).flatten
          # TODO: Validate!
          # TODO: All this other stuff, including the refresh rate
          #   Resolution: 1920 x 1080 @ 60Hz (1080p)
          #   Pixel Depth: 32-Bit Color (ARGB8888)
          #   Display Serial Number: LTS0R0262400
          #   Main Display: Yes
          #   Mirror: On
          #   Mirror Status: Master Mirror
          #   Online: Yes
          #   Rotation: Supported
          #   Television: Yes
          instance.width = width
          instance.height = height
        elsif OS.unix?
          width, height = `xrandr`.scan(/current (\d+) x (\d+)/).flatten
          # TODO: Validate!
          instance.width = width
          instance.height = height
        end

        instance
      end

      # Get the resolution of the primary display.
      #
      # @return [Dimensions]
      # @since 0.2.0
      def resolution
        primary.resolution
      end

      # Get the width of the primary display.
      #
      # @return [Integer]
      # @since 0.2.0
      def width
        resolution.width
      end

      # Get the height of the primary display.
      #
      # @return [Integer]
      # @since 0.2.0
      def height
        resolution.height
      end
    end

    include Helpers::HasAttributes

    def initialize(attributes={})
      @resolution = Dimensions.new

      update_attributes(attributes)
    end

    # @method resolution
    # Get the resolution.
    #
    # @return [Dimensions]

    # @method resolution=
    # Set the resolution.
    #
    # @param [Dimensions]
    # @return [Dimensions]
    attribute(:resolution) do |value|
      return nil if value.nil?

      value.is_a?(Dimensions) ? value : Dimensions.new(value)
    end

    # Get the width.
    #
    # @return [Integer]
    def width
      @resolution.width
    end

    # Set the width.
    #
    # @param [#to_i] value
    # @return [Integer]
    def width=(value)
      @resolution.width = value
    end

    # Get the height.
    #
    # @return [Integer]
    def height
      @resolution.height
    end

    # Set the height.
    #
    # @param [#to_i] value
    # @return [Integer]
    def height=(value)
      @resolution.height = value
    end
  end
end
