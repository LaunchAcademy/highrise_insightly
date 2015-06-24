require 'spec_helper'

describe HighriseInsightly::Highrise::Note do
  let(:author) {"Corinne B."}
  let(:about) { "John Smith" }
  let(:body) { "Inmailed" }
  let(:string_time) { "September 19, 2013 22:03" }

  let(:note) do
    described_class.new([
      {"Author"=> author},
      {"Written"=> string_time},
      {"About"=> about},
      {"Body"=> body}
    ])
  end

  it 'has an author' do
    expect(note.author).to eq(author)
  end

  it 'has an about' do
    expect(note.about).to eq(about)
  end

  it 'has a body' do
    expect(note.body).to eq(body)
  end
end
