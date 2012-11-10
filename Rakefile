require 'rake/version_task'
require 'rspec/core/rake_task'
require 'rubygems/package_task'
require 'pathname'

spec = Gem::Specification.new do |s|
  s.name         = 'system'
  s.version      = Pathname.new(__FILE__).dirname.join('VERSION').read.strip
  s.author       = ['Roja Buck', 'Ryan Scott Lewis']
  s.email        = ['roja@arbia.co.uk', 'ryan@rynet.us']
  s.homepage     = "http://github.com/roja/#{s.name}"
  s.summary      = 'System is a pure ruby interface to gather current systems information; OS, CPU, Filesystem etc...'
  s.description  = 'System is a pure ruby interface to gather systems information from the current host. System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem etc...'
  s.require_path = 'lib'
  s.files        = `git ls-files`.lines.to_a.collect { |s| s.strip }
  s.executables  = `git ls-files -- bin/*`.lines.to_a.collect { |s| File.basename(s.strip) }
  
  s.add_development_dependency 'version', '~> 1.0.0'
  s.add_development_dependency 'rake', '~> 0.9'
  s.add_development_dependency 'guard-rspec', '~> 2.1.1'
  s.add_development_dependency 'guard-yard', '~> 2.0.1'
  s.add_development_dependency 'rb-fsevent', '~> 0.9.1'
  s.add_development_dependency 'fuubar', '~> 1.1'
  s.add_development_dependency 'kramdown', '~> 0.14.0'
end

Rake::VersionTask.new do |t|
  t.with_git_tag = true
  t.with_gemspec = spec
end

RSpec::Core::RakeTask.new

Gem::PackageTask.new(spec) do |t|
  t.need_zip = false
  t.need_tar = false
end

task :default => :spec
