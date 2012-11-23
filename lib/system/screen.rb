require 'system/os'
require 'system/screen/resolution'

class System
  
  # Information about the computer's attached screen(s).
  # 
  # @since 0.1.4
  class Screen
    
    class << self
      
      # The user's primary Screen.
      # 
      # @return [Screen]
      # @since 0.1.4
      def primary
        
      end
      
      # The user's primary Screen's resolution.
      # 
      # @return [Screen::Resolution]
      # @since 0.1.4
      def resolution
        
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
