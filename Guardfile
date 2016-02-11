require "pathname"

guard :bundler do
  files = ["Gemfile"] + Dir["*.gemspec"]

  files.each { |file| watch(file) }
end

group :development, halt_on_fail: true do
  guard :rspec, cmd: "bundle exec rspec" do
    watch(%r{lib/.+\.rb})
    watch(%r{spec/.+\.rb})
  end

  guard :yard do
    watch(%r{lib/.+\.rb})
  end

  guard :rubocop do
    watch(%r{(lib|spec)/.+\.rb})
    watch(".rubocop.yml")
  end
end
