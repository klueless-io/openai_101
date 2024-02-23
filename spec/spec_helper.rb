# frozen_string_literal: true

require 'pry'
require 'bundler/setup'
require 'simplecov'

SimpleCov.start

require 'openai_101'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'
  config.filter_run_when_matching :focus

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # I enable tools during course development, this is not turned on in CI
  if ENV['TOOLS_ENABLED'] == 'true'
    config.filter_run :tools_enabled
  else
    config.filter_run_excluding :tools_enabled
  end
end
