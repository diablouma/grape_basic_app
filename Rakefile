#!/usr/bin/env rake
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :spec
task :test => :spec

task :app do
  puts "Starting App on port 9292"
  sh "rackup config.ru --host 0.0.0.0 --port 9292"
end
