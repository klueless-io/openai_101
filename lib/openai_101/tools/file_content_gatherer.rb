# frozen_string_literal: true

module Openai101
  module Tools
    # Gather content from files in a directory, used by gpt_context_gatherer.rb
    class FileContentGatherer
      attr_reader :include_patterns, :exclude_patterns

      def initialize(include_pattern: nil, include_patterns: [], exclude_patterns: [])
        @include_patterns = Array(include_pattern) + include_patterns
        @exclude_patterns = exclude_patterns
      end

      def build
        concatenated_content = []

        include_patterns.each do |pattern|
          Dir.glob(pattern).each do |file_path|
            next if excluded?(file_path) || File.directory?(file_path)

            content = "# file: #{file_path}\n\n#{File.read(file_path)}"
            concatenated_content << content
          end
        end

        concatenated_content.join("\n\n")
      end

      private

      def excluded?(file_path)
        exclude_patterns.any? { |pattern| File.fnmatch(pattern, file_path) }
      end
    end
  end
end
