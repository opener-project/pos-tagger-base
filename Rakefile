require 'bundler/gem_tasks'
require 'opener/build-tools/tasks/python'
require 'opener/build-tools/tasks/clean'

require_relative 'ext/hack/support'

desc 'Lists all the files of the Gemspec'
task :files do
  gemspec = Gem::Specification.load('opener-pos-tagger-base.gemspec')

  puts gemspec.files.sort
end

desc 'Verifies the requirements'
task :requirements do
  verify_requirements
end

desc 'Cleans up the repository'
task :clean => ['clean:pyc', 'clean:tmp', 'clean:python_packages', 'clean:gems']

desc 'Alias for python:compile'
task :compile => 'python:compile'

desc 'Runs the tests'
task :test => :compile do
  sh('cucumber features')
end

desc 'Performs preparations for building the Gem'
task :before_build => [:requirements, 'clean:pyc'] do
  install_python_packages(PRE_BUILD_REQUIREMENTS, 'pre_build')
end

task :build   => :before_build
task :default => :test
