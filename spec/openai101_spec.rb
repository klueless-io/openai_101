# frozen_string_literal: true

RSpec.describe Openai101 do
  it 'has a version number' do
    expect(Openai101::VERSION).not_to be_nil
  end

  it 'has a standard error' do
    expect { raise Openai101::Error, 'some message' }
      .to raise_error('some message')
  end
end
