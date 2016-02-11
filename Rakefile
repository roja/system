# Package task

require "pathname"
require "rubygems/package_task"

PROJECT_ROOT = Pathname.new(__FILE__).join("..").expand_path

gemspec = Pathname.glob(PROJECT_ROOT.join("*.gemspec")).first
spec = Gem::Specification.load(gemspec.to_s)

Gem::PackageTask.new(spec) do |task|
  task.need_zip = false
end

# RSpec

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

# Mutant

desc "Mutation testing"
task :mutant do
  exec("bundle exec mutant --include lib --require aspect --use rspec System* | tee spec/mutants.txt")
end

# Reek

require "reek/rake/task"

Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

# Rubocop

require "rubocop/rake_task"

RuboCop::RakeTask.new do |task|
  task.patterns = ["{lib,spec}/**/*.rb"]
end

# YARD

require "yard"

YARD::Rake::YardocTask.new

# Yardstick

require "yardstick/rake/measurement"

options = YAML.load_file(".yardstick.yml")
Yardstick::Rake::Measurement.new(:yardstick, options) do |measurement|
  measurement.output = PROJECT_ROOT.join("doc", "coverage.txt")
end

# Version

require "rake/version_task"

Rake::VersionTask.new do |task|
  task.with_git_tag = true
end
