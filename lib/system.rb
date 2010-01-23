# system includes
require 'singleton'

# java includes
if /java/.match(RUBY_PLATFORM)
  require 'java'
  import 'java.lang.System'
end

module HostSystem

  def self.os
    SystemInfo.instance.os
  end

  def self.jruby?
    !(/java/.match(RUBY_PLATFORM).nil?)
  end

  class SystemInfo
    include Singleton

    def initialize
    end
    
    def os
      return @os if defined? @os # if we already know then pass it
      if HostSystem::jruby?
        @os = case System.getProperty('os.name').downcase
        when /linux/ then :linux
        when /win/ then :windows
        when /solaris/ then :solaris
        when /bsd/ then :bsd
        when /darwin/ then :darwin
        when /mac.*?os.*?x/ then :osx
        else
          :unknown
        end
      else
        potential_os = case RUBY_PLATFORM
        when /linux/ then :linux
        when /win/ then :windows
        when /solaris/ then :solaris
        when /bsd/ then :bsd
        when /darwin/ then :darwin
        else
          :unknown
        end
        potential_os = :osx if potential_os == :darwin && defined? Config::CONFIG && Config::CONFIG['build_vendor'] == 'apple'
        @os = potential_os
      end      
    end

  end

end