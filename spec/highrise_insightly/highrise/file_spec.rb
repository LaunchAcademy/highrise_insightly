require 'spec_helper'

describe HighriseInsightly::Highrise::File do
  let(:file_path) do
    ::File.join(::File.dirname(__FILE__),
      '../../fixtures/sample_file.txt')
  end

  let(:highrise_file) do
    described_class.new(file_path)
  end

  it 'has a name' do
    expect(highrise_file.name).to_not be_nil
  end

  it 'has an email' do
    expect(highrise_file.emails).to_not be_nil
    expect(highrise_file.emails).to_not be_empty
  end

  it 'has an array of notes' do
    expect(highrise_file.notes).to_not be_nil
    expect(highrise_file.notes).to_not be_empty
  end

  it 'has an array of emails' do
    expect(highrise_file.emails).to_not be_nil
    expect(highrise_file.emails).to_not be_empty
  end
end

