#!/usr/bin/env rake
require "rspec/core/rake_task"

task :app do
  puts "Starting App on port 9292"
  sh "rackup config.ru --host 0.0.0.0 --port 9292"
end

task :test_unit do
  puts "Running unit tests"
  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = 'spec/unit/*_spec.rb'
  end
  Rake::Task["spec"].execute
end

task :test_integration do
  puts "Running integration tests"
  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = 'spec/integration/*_spec.rb'
  end
  Rake::Task["spec"].execute
end

task :test_functional do
  puts "Running functional tests"
  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = 'spec/functional/*_spec.rb'
  end
  Rake::Task["spec"].execute
end

task :test => [:test_unit, :test_integration, :test_functional]
