require 'pathname'

def require_task(path)
  begin
    require path
    
    yield
  rescue LoadError
    puts '', "Could not load '#{path}'.", 'Try to `rake gem:spec` and `bundle install` and try again.', ''
  end
end

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
  
  s.add_dependency 'version', '~> 1.0.0'
  s.add_development_dependency 'rake', '~> 0.9'
  s.add_development_dependency 'guard-rspec', '~> 2.1.1'
  s.add_development_dependency 'guard-yard', '~> 2.0.1'
  s.add_development_dependency 'rb-fsevent', '~> 0.9.1'
  s.add_development_dependency 'fuubar', '~> 1.1'
  s.add_development_dependency 'kramdown', '~> 0.14.0'
end


require_task 'rake/version_task' do
  Rake::VersionTask.new do |t|
    t.with_git_tag = true
    t.with_gemspec = spec
  end
end

namespace :gem do
  desc 'Generate the gemspec defined in this Rakefile'
  task :spec do
    Pathname.new("#{spec.name}.gemspec").open('w') { |f| f.write(spec.to_ruby) }
  end
end

task :gemspec => 'gem:spec'

require 'rubygems/package_task'
Gem::PackageTask.new(spec) do |t|
  t.need_zip = false
  t.need_tar = false
end

task :default do
  puts `rake -T`
end
