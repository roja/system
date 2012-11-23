class System
  class Screen
    
    # Defines a screen resolution.
    # 
    # @since 0.1.4
    class Resolution
      
      # @overload initialize(width=0, height=0)
      #   @param [Symbol] width
      #   @param [Object] height
      # @overload initialize(width: 0, height: 0)
      #   @param [{ :width => 0, :height => 0 }] value describe value param
      # @since 0.1.4
      # @raise [ArgumentError, TypeError]
      def initialize(opts={})
      
      end
      
      # Return the width of the Resolution instance as an Integer, in pixels.
      # 
      # @return [Integer]
      # @since 0.1.4
      def width
        
      end
      
      # Return the height of the Resolution instance as an Integer, in pixels.
      # 
      # @return [String]
      # @since 0.1.4
      def height
        
      end
      
      # Return the Resolution instance as a String.
      # 
      # @return [String]
      # @since 0.1.4
      def to_s
        "#{@width}x#{@height}"
      end
      
      # Return the Resolution instance as an Array.
      # 
      # @return [<Integer>]
      # @since 0.1.4
      def to_a
        [@width, @height]
      end
      
      # Return the Resolution instance as a Hash.
      # 
      # @return [{ Symbol => Integer }]
      # @since 0.1.4
      def to_h
        [@width, @height]
      end
      
    end
    
  end
end
