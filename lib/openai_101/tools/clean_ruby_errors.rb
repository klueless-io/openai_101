# frozen_string_literal: true

module Openai101
  module Tools
    # Clean Ruby Errors
    module ReportFormatter
      def print_column_names(column_definitions)
        headings = column_definitions.map { |_, col| col[:label].ljust(col[:width]) }.join(' | ')
        separator_length = column_definitions.sum { |_, col| col[:width] } + ((column_definitions.keys.size - 1) * 3)

        puts '-' * separator_length
        puts headings
        puts '-' * separator_length
      end

      def print_line(column_definitions, **column_key_values)
        line = column_definitions.map do |key, col|
          value = column_key_values[key] || ''
          value.to_s.ljust(col[:width])
        end.join(' | ')
        puts line
      end
    end

    # Convert EDL to YouTube description chapters
    class CleanRubyErrors
      include ReportFormatter

      attr_reader :file
      attr_reader :error
      attr_reader :errors

      def initialize(file)
        @file = file
        @errors = []
      end

      def parse
        capture_code = []
        capture_stack = []

        lines.each do |line|
          @section = detect_section(line)

          case section
          when :new_error
            add_stack_to_error(error, capture_stack) if capture_stack.any? && error

            @error = initialize_error(line)
            errors << error

          when :failure_error1
            error[:error_technique] = '1'
            capture_code = []
            @section = :capture_failure_error
          when :failure_error2
            error[:error_technique] = '2'
            capture_code = []
            @section = :capture_failure_error
          when :capture_failure_error
            capture_code << line.rstrip
          when :actual_error
            error[:error_type] = line.strip
            error[:code_section] = format_code(capture_code)
            capture_stack = []
            @section = :capture_stack
          when :capture_stack
            capture_stack << line.strip
          end
        end

        add_stack_to_error(error, capture_stack) if capture_stack.any? && error
      end

      def print_errors(errors)
        column_definitions = {
          test_number: { label: '#', width: 5 },
          test_technique: { label: 'Style', width: 7 },
          error_at: { label: 'Error At', width: 70 },
          error_by: { label: 'Error By', width: 80 },
          error_type: { label: 'Error Type', width: 20 },
          error_message: { label: 'Error Message', width: 180 }
        }

        print_column_names(column_definitions)

        errors.each do |error|
          print_line(column_definitions,
                     test_number: error[:test_number],
                     test_technique: error[:error_technique],
                     error_at: "#{error[:error_at][:file]}:#{error[:error_at][:line]}",
                     error_by: "#{error[:error_by][:file]}:#{error[:error_by][:line]}",
                     error_type: error[:error_type],
                     error_message: error[:error_message])
        end

        print_column_names(column_definitions)
      end

      def print_aggregated_error(errors)
        aggregated_errors = aggregate_errors(errors)
        # puts JSON.pretty_generate(aggregated_errors.first)

        # puts '----------------------'
        # puts aggregated_errors.first

        column_definitions = {
          error_type: { label: 'Error Type', width: 20 },
          error_message: { label: 'Error Message', width: 180 },
          error_at_file: { label: 'Error At File', width: 70 },
          error_at_lines: { label: 'L#', width: 5 },
          error_by_file: { label: 'Error By File', width: 80 },
          error_by_lines: { label: 'Lines', width: 30 }
        }

        print_column_names(column_definitions)

        aggregated_errors.each do |error|
          print_line(column_definitions,
                     error_type: error[:error_type],
                     error_message: error[:error_message],
                     error_at_file: error[:error_at_file],
                     error_at_lines: error[:error_at_lines].join(', '),
                     error_by_file: error[:error_by_file],
                     error_by_lines: error[:error_by_lines].join(', '))
        end

        print_column_names(column_definitions)
      end

      #   # column_definitions = {
      #   #   error_message: { label: "Error Message", width: 180 },
      #   # }

      #   # # Print the report
      #   # puts "Error Message | Source File(Line Numbers) | Spec File(Line Numbers)"
      #   # puts "-" * 100

      #   # aggregated_errors.each do |(message, source_file, spec_file), lines|
      #   #   source_lines = lines[:source_lines].uniq.sort.join(', ')
      #   #   spec_lines = lines[:spec_lines].uniq.sort.join(', ')
      #   #   puts "#{message} | #{source_file}(#{source_lines}) | #{spec_file}(#{spec_lines})"
      #   # end
      # end

      private

      def lines
        @lines ||= File.readlines(file)
      end

      def detect_section(line)
        return :new_error           if line.match?(/^\d+\)/)
        return :failure_error2      if line.include?('Failure/Error: ') # Note the space
        return :failure_error1      if line.include?('Failure/Error:')
        return :actual_error        if line.include?('Error:')

        section
      end

      def section
        @section ||= :start
      end

      def initialize_error(line)
        {
          error_type: '',
          error_technique: '',
          test_number: extract_error_number(line),
          code_section: [],
          error_message: '',
          error_messages: [],
          stack: [],
          error_at: { file: '', line: 0 },
          error_by: { file: '', line: 0 }
        }
      end

      def extract_error_number(line)
        match = line.match(/^(\d+)\)/)
        match ? match[1] : nil
      end

      def format_code(code_lines)
        return 'Investigate!!!' if code_lines.empty?

        first_line_spaces = code_lines.first[/\A */].size
        code_lines.map { |line| line[first_line_spaces..] }.compact
      end

      def add_stack_to_error(error, stack_lines)
        error_messages, stack_trace = split_strack_from_errors(stack_lines)

        error[:error_message] = error_messages.join(' ')
        error[:error_messages] = error_messages
        error[:stack] = stack_trace

        error[:error_at] = extract_error_location(stack_trace)
        error[:error_by] = extract_test_location(stack_trace)
      end

      def split_strack_from_errors(stack_lines)
        error_messages, stack_trace = stack_lines.partition { |line| !line.start_with?('#') }

        clean_error_messages = error_messages.reject(&:empty?)
        clean_stack_trace = stack_trace.map { |line| line.sub(/^#\s*/, '') }

        [clean_error_messages, clean_stack_trace]
      end

      def extract_error_location(stack_trace)
        return { file: '', line: 0 } if stack_trace.empty?

        # Matches on file paths ending in .rb followed by a colon and a line number.
        # It captures the file path and line number into named groups 'file' and 'line'.
        # Example Match: "./app/models/user.rb:13" => file: "./app/models/user.rb", line: "13"
        match = stack_trace.first.match(/(?<file>.*\.rb):(?<line>\d+)/)
        match ? { file: match[:file], line: match[:line] } : { file: 'XXXXXX1', line: 0 }
      end

      def extract_test_location(stack_trace)
        stack_trace.reverse_each do |trace_line|
          # Searches for file paths that specifically end with _spec.rb (indicating a test file),
          # followed by a colon and a line number. It captures the test file path and line number.
          # Example Match: "./spec/models/user_spec.rb:26" => file: "./spec/models/user_spec.rb", line: "26"
          if (match = trace_line.match(/(?<file>.*_spec\.rb):(?<line>\d+)/))
            return { file: match[:file], line: match[:line] }
          end
        end
        { file: 'XXXXXX2', line: 0 } # Return a default value if no test location is found
      end

      def aggregate_errors(errors)
        # Initialize an empty hash for aggregations
        aggregated_errors = {}

        errors.each do |error|
          # Create a unique key for each aggregation based on error_message, error_at[:file], and error_by[:file]
          key = [
            error[:error_message],
            error[:error_at][:file],
            error[:error_by][:file]
          ].join('|')

          # If the aggregation key doesn't exist, initialize it
          aggregated_errors[key] ||= {
            error_type: error[:error_type],
            error_message: error[:error_message],
            code_section: error[:code_section], # Assuming code_section is the same for aggregated errors
            error_at: { file: error[:error_at][:file], lines: [] },
            error_by: { file: error[:error_by][:file], lines: [] }
          }

          # Append unique error messages and line numbers for error_at and error_by
          aggregated_errors[key][:error_at][:lines] |= [error[:error_at][:line]]
          aggregated_errors[key][:error_by][:lines] |= [error[:error_by][:line]]
        end

        # Convert the aggregated_errors hash back into an array of values
        aggregated_errors.values.map do |error|
          {
            error_type: error[:error_type],
            error_message: error[:error_message],
            code_section: error[:code_section].join("\n"),
            error_at_file: error[:error_at][:file],
            error_at_lines: error[:error_at][:lines],
            error_by_file: error[:error_by][:file],
            error_by_lines: error[:error_by][:lines]
          }
        end
      end
    end
  end
end
