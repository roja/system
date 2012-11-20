# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "system"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roja Buck", "Ryan Scott Lewis"]
  s.date = "2012-11-20"
  s.description = "System is a pure ruby interface to gather systems information from the current host. System offers a simple to use interface to gather an array of information including; OS, CPU, Filesystem etc..."
  s.email = ["roja@arbia.co.uk", "ryan@rynet.us"]
  s.files = [".gitignore", ".rvmrc", "Gemfile", "Gemfile.lock", "Guardfile", "LICENSE", "NOTES.md", "README.md", "Rakefile", "VERSION", "lib/system.rb", "lib/system/backwards_compatibility.rb", "lib/system/cpu.rb", "lib/system/os.rb", "lib/system/ruby.rb", "lib/system/version.rb", "spec/spec_helper.rb", "spec/system/backwards_compatibility_spec.rb", "spec/system/version_spec.rb", "system.gemspec"]
  s.homepage = "http://github.com/roja/system"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "System is a pure ruby interface to gather current systems information; OS, CPU, Filesystem etc..."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<version>, ["~> 1.0.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.9"])
      s.add_development_dependency(%q<guard-rspec>, ["~> 2.1.1"])
      s.add_development_dependency(%q<guard-yard>, ["~> 2.0.1"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
      s.add_development_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_development_dependency(%q<kramdown>, ["~> 0.14.0"])
    else
      s.add_dependency(%q<version>, ["~> 1.0.0"])
      s.add_dependency(%q<rake>, ["~> 0.9"])
      s.add_dependency(%q<guard-rspec>, ["~> 2.1.1"])
      s.add_dependency(%q<guard-yard>, ["~> 2.0.1"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
      s.add_dependency(%q<fuubar>, ["~> 1.1"])
      s.add_dependency(%q<kramdown>, ["~> 0.14.0"])
    end
  else
    s.add_dependency(%q<version>, ["~> 1.0.0"])
    s.add_dependency(%q<rake>, ["~> 0.9"])
    s.add_dependency(%q<guard-rspec>, ["~> 2.1.1"])
    s.add_dependency(%q<guard-yard>, ["~> 2.0.1"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9.1"])
    s.add_dependency(%q<fuubar>, ["~> 1.1"])
    s.add_dependency(%q<kramdown>, ["~> 0.14.0"])
  end
end
