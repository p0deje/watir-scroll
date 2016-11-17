require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.rspec_opts = %w(--color)
  spec.pattern = 'spec/**/*_spec.rb'
end

task default: :spec
