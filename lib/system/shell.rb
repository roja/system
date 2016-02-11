require "system/environment"

module System
  # Information about the current shell.
  #
  # @since 0.2.0
  class Shell
    # class << self
    #   # Get the size of the shell.
    #   #
    #   # @return [nil, Hash]
    #   # @since 0.2.0
    #   def size
    #     return nil unless STDIN.tty?
    #
    #     if ENV["COLUMNS"] =~ /^\d+$/ && ENV["LINES"] =~ /^\d+$/
    #       width, height = [ENV["COLUMNS"].to_i, ENV["LINES"].to_i]
    #     elsif Environment.executable_exists?("tput")
    #       width, height = `tput cols && tput lines`
    #     elsif Environment.executable_exists?("stty")
    #       width, height = `stty size`.split.collect(&:to_i).reverse
    #     else
    #       return nil
    #     end
    #
    #     { width: width, height: height }
    #   end
    #
    #   def width
    #     size
    # end

    class << self
      # Get the shell size.
      #
      # @return [nil, {Symbol => Integer}]
      # @since 0.2.0
      def size
        return unless Environment.exist?

        return [ENV["COLUMNS"].to_i, ENV["LINES"].to_i] if (ENV["COLUMNS"] =~ /^\d+$/) && (ENV["LINES"] =~ /^\d+$/)
        return `tput cols && tput lines`.split.collect(&:to_i) if Environment.executable_exists?("tput")
        return `stty size`.split.collect(&:to_i).reverse if Environment.executable_exists?("stty")

        raise StandardError
      end

      # Get the current shell.
      #
      # @return [Shell, nil]
      # @since 0.2.0
      def current
        return @current unless @current.nil?
        width, height = size

        @current = Shell.new(width: width, height: height)
      rescue
        nil
      end

      # Return the current shell instance's width in pixels.
      #
      # @return [Integer]
      # @since 0.2.0
      def width
        current.width
      end

      # Return the current shell instance's height in pixels.
      #
      # @return [Integer]
      # @since 0.2.0
      def height
        current.height
      end
    end

    # @overload initialize(width=0, height=0)
    #   @param [Symbol] width
    #   @param [Object] height
    # @overload initialize(width: 0, height: 0)
    #   @param [{ :width => 0, :height => 0 }] value describe value param
    # @since 0.2.0
    # @raise [ArgumentError, TypeError]
    def initialize(opts={})
    end
  end
end
