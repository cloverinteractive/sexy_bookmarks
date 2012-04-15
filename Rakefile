#!/usr/bin/env rake

require "bundler/gem_tasks"

require 'rake'
desc 'Default: run all tests.'
task :default => :test

require 'rake/testtask'
Rake::TestTask.new( :test )  do |test|
  test.libs << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end
