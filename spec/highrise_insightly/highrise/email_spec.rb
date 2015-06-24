require 'spec_helper'

describe HighriseInsightly::Highrise::Email do
  let(:email) do
    described_class.new([
      {"Author"=>"Corinne B."},
      {"Written"=>"January 08, 2015 15:10"},
      {"About"=>"John Smith"},
      {"Subject"=>"This is an email"},
      {"Body"=>"Hi John,\n\nThis is an email"}
    ])
  end

  it 'has a subject' do
    expect(email.subject).to_not be_nil
  end
end
