# frozen_string_literal: true

# source: https://stephenagrice.medium.com/making-a-command-line-ruby-gem-write-build-and-push-aec24c6c49eb

GEM_NAME = 'openai_101'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'openai_101/version'

RSpec::Core::RakeTask.new(:spec)

require 'rake/extensiontask'

desc 'Compile all the extensions'
task build: :compile

Rake::ExtensionTask.new('openai_101') do |ext|
  ext.lib_dir = 'lib/openai_101'
end

desc 'Publish the gem to RubyGems.org'
task :publish do
  version = Openai101::VERSION
  system 'gem build'
  system "gem push #{GEM_NAME}-#{version}.gem"
end

desc 'Remove old *.gem files'
task :clean do
  system 'rm *.gem'
end

task default: %i[clobber compile spec]
