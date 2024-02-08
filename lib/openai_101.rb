# frozen_string_literal: true

require 'openai_101/version'

module Openai101
  # raise Openai101::Error, 'Sample message'
  Error = Class.new(StandardError)

  # Your code goes here...
end

if ENV.fetch('KLUE_DEBUG', 'false').downcase == 'true'
  namespace = 'Openai101::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('openai_101/version') }
  version   = Openai101::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
