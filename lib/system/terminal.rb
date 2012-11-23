require 'system/os'
require 'system/ruby'
require 'system/shell'

class System
  
  # Information about the current Terminal, if outputting to one.
  # 
  # @since 0.1.4
  module Terminal
    class << self
      
      # Return the current Terminal instance.
      # 
      # @return [Terminal, nil]
      # @since 0.1.4
      def current
        return @current unless @current.nil?
        
        width, height = if (ENV['COLUMNS'] =~ /^\d+$/) && (ENV['LINES'] =~ /^\d+$/)
          [ENV['COLUMNS'].to_i, ENV['LINES'].to_i]
        elsif Ruby.java? || (!STDIN.tty? && ENV['TERM']) && command_exists?('tput')
          [`tput cols`.to_i, `tput lines`.to_i]
        elsif STDIN.tty? && command_exists?('stty')
          `stty size`.scan(/\d+/).map { |s| s.to_i }.reverse
        else
          raise StandardError
        end
        
        @current = Terminal.new(width: width, height: height)
      rescue
        nil
      end
      
      # Return the current Terminal instance's width in pixels.
      # 
      # @return [Integer]
      # @since 0.1.4
      def width
        current.width
      end
      
      # Return the current Terminal instance's height in pixels.
      # 
      # @return [Integer]
      # @since 0.1.4
      def height
        current.height
      end
      
    end
    
    # @overload initialize(width=0, height=0)
    #   @param [Symbol] width
    #   @param [Object] height
    # @overload initialize(width: 0, height: 0)
    #   @param [{ :width => 0, :height => 0 }] value describe value param
    # @since 0.1.4
    # @raise [ArgumentError, TypeError]
    def initialize(opts={})
      
    end
    
  end
end