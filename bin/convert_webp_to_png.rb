#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry'
require 'optparse'
require_relative '../lib/openai_101/tools/webp_to_png'

options = {
  prefix: nil,
  debug: false,
  dry_run: false
}

OptionParser.new do |opts|
  opts.banner = 'Usage: convert_webp_to_png.rb [options]'

  opts.on('-s', '--source=SOURCE', 'Source directory containing WEBP files') do |source|
    options[:source_folder] = source
  end

  opts.on('-t', '--target=TARGET', 'Target directory for PNG files') do |target|
    options[:target_folder] = target
  end

  opts.on('-f', '--filename=FILENAME', 'Specific target filename for the PNG output') do |filename|
    options[:target_filename] = filename
  end

  opts.on('-p', '--prefix=PREFIX', 'Optional prefix for the target filename') do |prefix|
    options[:prefix] = prefix
  end

  opts.on('-d', '--debug', 'Enable debug mode') do
    options[:debug] = true
  end

  opts.on('--dry-run', 'Simulate the conversion process without making any changes') do
    options[:dry_run] = true
  end

  opts.on('-h', '--help', 'Prints this help') do
    puts opts
    exit
  end
end.parse!

unless options[:target_filename]
  puts 'A target filename is required.'
  exit
end

converter = Openai101::Tools::WebpToPng.new(
  source_folder: options[:source_folder],
  target_folder: options[:target_folder],
  target_filename: options[:target_filename],
  prefix: options[:prefix]
)

if options[:debug]
  puts "Source folder       : #{converter.source_folder}"
  puts "Target folder       : #{converter.target_folder}"
  puts "Target filename     : #{converter.target_filename}"
  puts "Source filename     : #{converter.source_filename}"
  puts "Prefix              : #{converter.prefix}"
  puts "Target prompt       : #{converter.prompt}"
  puts "Target PNG file     : #{converter.target_png_file}"
  puts "Target Prompt file  : #{converter.target_prompt_file}"
end

if options[:dry_run]
  puts 'Dry run enabled - no changes will be made.'
  exit
end

converter.sanitize_all_webp_files

if converter.source?
  converter
    .convert
    .store_prompt
    .backup_source
    .delete_source
  puts 'Conversion and processing complete.'
else
  puts "\e[31mNo source file found\e[0m"
end
