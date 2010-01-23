# system includes
require 'singleton'
require 'rbconfig'

# java includes
if /java/.match(RUBY_PLATFORM)
  require 'java'
  import 'java.lang.System'
end

module HostSystem

  def self.os
    return @os if defined? @os # if we already know then pass it
    os_name = RUBY_PLATFORM
    os_name = RbConfig::CONFIG['host_os'] if defined? RbConfig::CONFIG
    os_name = System.getProperty('os.name').downcase if jruby?
    @os = case os_name
    when /linux/ then :linux
    when /win/ then :windows
    when /solaris/ then :solaris
    when /bsd/ then :bsd
    when /darwin/ then
      defined? RbConfig::CONFIG && RbConfig::CONFIG['build_vendor'] == 'apple' ? :osx : :darwin
    when /mac.*?os.*?x/ then :osx
    else
      :unknown
    end
  end

  def self.java?
    !(/java/.match(RUBY_PLATFORM).nil?)
  end

  def self.jruby?
    if HostSystem::java?
      /jruby/.match(RUBY_ENGINE)
    else
      false
    end
  end

end