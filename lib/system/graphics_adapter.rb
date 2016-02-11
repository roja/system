require "system/display"

module System
  # Information about the graphics adapters installed on the currently running system.
  #
  # @since 0.2.0
  class GraphicsAdapter
    class << self
    end

    # @method chipset_model
    # Get the chipset model.
    #
    # @return [nil, String]
    # @since 0.2.0

    # @method chipset_model=
    # Set the chipset model.
    #
    # @param [nil, #to_s] value
    # @return [nil, String]
    # @since 0.2.0
    attribute(:chipset_model) { |value| validate_optional_string(value) }

    # @method vram
    # Get the amount of VRAM.
    #
    # @return [nil, Integer]
    # @since 0.2.0

    # @method vram=
    # Set the amount of VRAM.
    #
    # @param [nil, #to_i] value
    # @return [nil, Integer]
    # @since 0.2.0
    attribute(:vram) { |value| validate_optional_integer(value) }

    # @method wram
    # Get the amount of WRAM.
    #
    # @return [nil, Integer]
    # @since 0.2.0

    # @method wram=
    # Set the amount of WRAM.
    #
    # @param [nil, #to_i] value
    # @return [nil, Integer]
    # @since 0.2.0
    attribute(:wram) { |value| validate_optional_integer(value) }

    # @method mdram
    # Get the amount of MDRAM.
    #
    # @return [nil, Integer]
    # @since 0.2.0

    # @method mdram=
    # Set the amount of MDRAM.
    #
    # @param [nil, #to_i] value
    # @return [nil, Integer]
    # @since 0.2.0
    attribute(:mdram) { |value| validate_optional_integer(value) }

    # @method sgram
    # Get the amount of SGRAM.
    #
    # @return [nil, Integer]
    # @since 0.2.0

    # @method sgram=
    # Set the amount of SGRAM.
    #
    # @param [nil, #to_i] value
    # @return [nil, Integer]
    # @since 0.2.0
    attribute(:sgram) { |value| validate_optional_integer(value) }

    # @method vendor_name
    # Get the vendor name.
    #
    # @return [nil, String]
    # @since 0.2.0

    # @method vendor_name=
    # Set the vendor name.
    #
    # @param [nil, #to_s] value
    # @return [nil, String]
    # @since 0.2.0
    attribute(:vendor_name) { |value| validate_optional_string(value) }

    # @method vendor_id
    # Get the vendor id.
    #
    # @return [nil, String]
    # @since 0.2.0

    # @method vendor_id=
    # Set the vendor id.
    #
    # @param [nil, #to_s] value
    # @return [nil, String]
    # @since 0.2.0
    attribute(:vendor_id) { |value| validate_optional_integer(value) }

    # @method device_id
    # Get the device id.
    #
    # @return [nil, String]
    # @since 0.2.0

    # @method device_id=
    # Set the device id.
    #
    # @param [nil, #to_s] value
    # @return [nil, String]
    # @since 0.2.0
    attribute(:device_id) { |value| validate_optional_integer(value) }

    # @method revision_id
    # Get the revision id.
    #
    # @return [nil, String]
    # @since 0.2.0

    # @method revision_id=
    # Set the revision id.
    #
    # @param [nil, #to_s] value
    # @return [nil, String]
    # @since 0.2.0
    attribute(:revision_id) { |value| validate_optional_integer(value) }

    # Get the displays attached to this display adapter.
    #
    # @return [<DisplayAdapter>]
    # @since 0.2.0
    def displays
      # TODO
    end

    protected

    def validate_optional_integer(value)
      return nil if value.nil?

      value.to_i
    end

    def validate_optional_string(value)
      return nil if value.nil?

      value.to_s.strip
    end
  end
end
