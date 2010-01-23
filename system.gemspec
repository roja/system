# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{system}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roja Buck"]
  s.date = %q{2010-01-23}
  s.description = %q{System is a pure ruby interface to gather systems information from the current host. System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem etc.}
  s.email = %q{roja@arbia.co.uk}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "Rakefile",
     "VERSION",
     "lib/system.rb",
     "test/helper.rb",
     "test/test_system.rb"
  ]
  s.homepage = %q{http://github.com/roja/system}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{system}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{System is a pure ruby interface to gather current systems information; OS, CPU, Filesystem etc.}
  s.test_files = [
    "test/helper.rb",
     "test/test_system.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

