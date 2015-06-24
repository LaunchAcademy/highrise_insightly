require 'spec_helper'

describe HighriseInsightly::Contact do
  let(:contact) do
    described_class.new("CONTACT_ID" => "1")
  end

  let(:note) do
    HighriseInsightly::Highrise::Note.new({})
  end

  let(:email) do
    HighriseInsightly::Highrise::Email.new({})
  end

  context 'creating a note' do
    it 'returns true when a 201 is received' do
      insightly_connection do |cnn|
        cnn.post('Notes'){ [201, {}, {}]}
      end

      result = contact.save_note(note)
      expect(result).to be(true)

    end
    it 'returns false when a 201 is not received' do
      insightly_connection do |cnn|
        cnn.post('Notes'){ [401, {}, {}] }
      end

      result = contact.save_note(note)
      expect(result).to be(false)
    end
  end

  context 'creating an email' do
    it 'returns true when a 201 is received' do
      insightly_connection do |cnn|
        cnn.post('Notes'){ [201, {}, {}]}
      end

      result = contact.save_email(email)
      expect(result).to be(true)
    end
  end

end
