# frozen_string_literal: true

RSpec.describe Openai101::Tools::FileContentGatherer, :tools_enabled do
  describe '#build' do
    let(:include_patterns) { ['spec/fixtures/**/*.txt'] }
    let(:exclude_patterns) { ['spec/fixtures/excluded/*.txt'] }
    subject { described_class.new(include_patterns: include_patterns, exclude_patterns: exclude_patterns) }

    context 'when gathering content' do
      fit 'concatenates content from files matching include patterns' do
        expect(subject.build).to include("File 1 content", "File 2 content")
      end

      it 'excludes content from files matching exclude patterns' do
        expect(subject.build).not_to include("Excluded file content")
      end

      it 'includes file paths as headers in the gathered content' do
        expect(subject.build).to include("# file: spec/fixtures/included/file1.txt")
      end
    end
  end
end
