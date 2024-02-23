# frozen_string_literal: true

RSpec.describe Openai101::Tools::CleanRubyErrors, :tools_enabled do
  subject { described_class.new(file) }

  let(:file) { 'ISSUES-SHORT.txt' }
  let(:file) { 'ISSUES.txt' }
  let(:output) { 'ISSUE-ERRORS.json' }

  describe '#parse' do
    fit 'parses the file' do
      subject.parse
      File.write(output, JSON.pretty_generate(subject.errors))

      subject.print_errors(subject.errors)
      subject.print_aggregated_error(subject.errors)
    end
  end
end

