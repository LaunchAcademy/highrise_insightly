require 'spec_helper'

describe HighriseInsightly::Highrise::FileList do
  let(:file_list) do
    described_class.new(
      File.join(File.dirname(__FILE__), '../../fixtures/*.txt')
    )
  end

  it 'has a coherent size' do
    expect(file_list.count).to eq(2)
  end

  it 'has a collection of files' do
    expect(file_list[0]).
      to be_kind_of(HighriseInsightly::Highrise::File)
  end
end
