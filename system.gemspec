require "pathname"

Gem::Specification.new do |spec|
  spec.name          = "system"
  spec.summary       = "A library to easily gather information on the current system environment."
  spec.description   = "System is a cross-platform and cross-implementation interface to gather system information from the current host.\n\nSystem offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem, etc."
  spec.license       = "MIT"
  spec.authors       = ["Roja Buck", "Ryan Scott Lewis"]
  spec.email         = ["roja@arbia.co.uk", "ryan@rynet.us"]
  spec.homepage      = "http://github.com/roja/system"

  spec.version       = Pathname.glob("VERSION*").first.read rescue "0.0.0"
  spec.require_paths = ["lib"]
  spec.files         = Dir["{Rakefile,Gemfile,README*,VERSION,LICENSE,*.gemspec,{lib,bin,examples,spec,test}/**/*}"]
  spec.test_files    = Dir["{examples,spec,test}/**/*"]

  spec.add_dependency("version", "~> 1.0.0")
  spec.add_dependency("aspect", "~> 0.0.2")
end
