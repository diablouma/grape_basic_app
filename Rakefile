#!/usr/bin/env rake
require "rspec/core/rake_task"

task :app do
  sh "cowsay '** Starting App on port 9292 **'"
  sh "./start.sh"
end

task :app_stop do
  sh "cowsay '** Stopping the App **'"
  sh "./stop.sh"
end

task :test_unit do
  sh "cowsay Running unit tests"
  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = 'spec/unit/*_spec.rb'
  end
  Rake::Task["spec"].execute
end

task :test_integration do
  sh "cowsay integration tests"
  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = 'spec/integration/*_spec.rb'
  end
  Rake::Task["spec"].execute
end

task :test_functional do
  sh "cowsay Running functional tests"
  RSpec::Core::RakeTask.new :spec do |task|
    task.pattern = 'spec/functional/*_spec.rb'
  end
  Rake::Task["spec"].execute
end

task :test => [:test_unit, :test_integration, :test_functional]
