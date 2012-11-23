require 'system/os'
require 'system/screen/resolution'

class System
  
  # Information about the computer's attached screen(s).
  # 
  # @since 0.1.4
  class Screen
    
    class << self
      
      # All Screen instances attached to the current host.
      # 
      # @return [<Screen>]
      # @since 0.1.4
      def all
        
      end
      
      # The current host's primary Screen.
      # 
      # @return [Screen]
      # @since 0.1.4
      def primary
        screen = new
        
        x, y = [nil, nil]
        
        if OS.windows?
          # SEE: http://stackoverflow.com/a/4631379/139089
          
          require 'dl/import'
          require 'dl/struct'
          
          user32 = DL.dlopen("user32")
          
          get_system_metrics = user32['GetSystemMetrics', 'ILI']
          x, tmp = get_system_metrics.call(0, 0)
          y, tmp = get_system_metrics.call(1, 0)
          
          [x, y]
        elsif OS.unix?
          `xrandr`.scan(/current (\d+) x (\d+)/).flatten
        end
        
        screen.resolution = Resolution.new(x: x, y: y)
        
        screen
      end
      
      # The current host's primary Screen's resolution.
      # 
      # @return [Screen::Resolution]
      # @since 0.1.4
      def resolution
        primary.resolution
      end
      
      # The current host's primary Screen's resolution's width.
      # 
      # @return [Integer]
      # @since 0.1.4
      def width
        resolution.width
      end
      
      # The current host's primary Screen's resolution's height.
      # 
      # @return [Integer]
      # @since 0.1.4
      def height
        resolution.height
      end
      
    end
    
    # Return the current Resolution that this Screen is using.
    # 
    # @return [Screen::Resolution]
    # @since 0.1.4
    def resolution
      
    end
    
    # Return an Array of Resolution instances that this Screen can handle.
    # 
    # @return [<Screen::Resolution>]
    # @since 0.1.4
    def available_resolutions
      
    end
    
  end
  
end
