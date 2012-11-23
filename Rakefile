require 'pathname'

$creating_gemspec = false

def require_task(path)
  begin
    require path
    
    yield
  rescue LoadError
    unless $creating_gemspec
      puts '', "Could not load '#{path}'.", 'Try to `rake gem:spec` and `bundle install` and try again.', ''
    end
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
  s.add_development_dependency 'github-markup', '~> 0.7.4'
  
  if RUBY_PLATFORM =~ /java/
    s.add_development_dependency 'kramdown', '~> 0.14.0'
  else
    s.add_development_dependency 'redcarpet', '~> 1'
  end
end

desc 'Generate the gemspec defined in this Rakefile'
task :gemspec do
  $creating_gemspec = true
  Pathname.new("#{spec.name}.gemspec").open('w') { |f| f.write(spec.to_ruby) }
end

require_task 'rake/version_task' do
  Rake::VersionTask.new do |t|
    t.with_git_tag = true
    t.with_gemspec = spec
  end
end

require 'rubygems/package_task'
Gem::PackageTask.new(spec) do |t|
  t.need_zip = false
  t.need_tar = false
end

task :default do
  # displayable_tasks = Rake.application.tasks
  # 
  # width = displayable_tasks.collect { |t| t.name_with_args.length }.max || 10
  # max_column = Rake.application.truncate_output? ? Rake.application.terminal_width - name.size - width - 7 : nil
  # 
  # displayable_tasks.each do |t|
  #   printf "#{name} %-#{width}s  # %s\n",
  #     t.name_with_args, max_column ? Rake.application.truncate(t.comment, max_column) : t.comment
  # end
end
