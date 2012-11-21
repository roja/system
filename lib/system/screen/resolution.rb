module System
  class Screen
    
    # Defines a screen resolution.
    # 
    # @since 0.1.4
    class Resolution
      
      def initialize
        
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
      
    end
    
  end
end
