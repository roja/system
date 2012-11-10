# System includes
require 'rbconfig'
require 'pathname'

# Java includes - Have to load this way to avoid overloading of our classes
if /java/.match(RUBY_PLATFORM) # TODO: For now, this is a good place for this but it will need abstracting..
  require 'java'
  import 'java.lang.System'
end

# Prepare LOAD_PATH
__LIB__ ||= Pathname.new(__FILE__).dirname
$:.unshift(__LIB__.to_s) unless $:.include?(__LIB__.to_s)

# Local includes
require 'system/version'
require 'system/ruby'
require 'system/os'
require 'system/cpu'
require 'system/backwards_compatibility'

# System is a cross-platform and cross-implementation interface to gather system information from the current host.
# 
# System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem, etc..
# 
# @since 0.1.0
class System; end