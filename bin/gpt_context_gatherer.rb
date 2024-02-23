#!/usr/bin/env ruby
# frozen_string_literal: true

# Usage:
#   ./bin/gpt_context_gatherer.rb -d -i 'lib/openai_101/tools/**/*.rb'
#   ./bin/gpt_context_gatherer.rb -d -i 'lib/openai_101/tools/**/*' -e 'node_modules/**/*' -e 'package-lock.json' -e 'lib/openai_101/tools/prompts/*.txt'
#
#   Get GPT Context Gatherer code
#   ./bin/gpt_context_gatherer.rb -i 'bin/**/*gather*.rb' -i 'lib/openai_101/tools/**/*gather*.rb'
require 'optparse'
require 'clipboard'
require_relative '../lib/openai_101/tools/file_content_gatherer'

options = {
  include_patterns: [],
  exclude_patterns: [],
  debug: false
}

OptionParser.new do |opts|
  opts.banner = 'Usage: gather_content.rb [options]'

  opts.on('-i', '--include PATTERN', 'Pattern or file to include (can be used multiple times)') do |pattern|
    options[:include_patterns] << pattern
  end

  opts.on('-e', '--exclude PATTERN', 'Pattern or file to exclude (can be used multiple times)') do |pattern|
    options[:exclude_patterns] << pattern
  end

  opts.on('-d', '--debug', 'Enable debug mode') do
    options[:debug] = true
  end

  opts.on_tail('-h', '--help', 'Show this message') do
    puts opts
    puts "\nExamples:"
    puts "  #{File.basename($PROGRAM_NAME)} -i 'lib/**/*.rb' -e 'lib/excluded/**/*.rb' -d"
    puts "  #{File.basename($PROGRAM_NAME)} --include 'src/**/*.js' --exclude 'src/vendor/**/*.js'"

    puts ''
    puts '  # Get GPT Context Gatherer code that is found in any folder (bin, lib & spec)'
    puts "  #{File.basename($PROGRAM_NAME)} -i '**/*gather*.rb'"
    exit
  end
end.parse!

pp options if options[:debug]

gatherer = Openai101::Tools::FileContentGatherer.new(
  include_patterns: options[:include_patterns],
  exclude_patterns: options[:exclude_patterns]
)

content = gatherer.build

if options[:debug]
  puts '-' * 80
  puts content
  puts '-' * 80
end

Clipboard.copy(content)
