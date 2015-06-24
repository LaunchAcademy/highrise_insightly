module HighriseInsightly
  class Contact
    def initialize(attributes)
      @id = attributes["CONTACT_ID"]
    end

    def save_note(note)
      resp = insightly_client.post('Notes', {
        'TITLE' => "Highrise Note Import From #{note.written}",
        'BODY' => note.body,
        'LINK_SUBJECT_ID' => @id,
        'LINK_SUBJECT_TYPE' => 'CONTACT',
        'DATE_CREATED_UTC' => note.written.utc.to_s.gsub(" UTC", "")
      })

      if resp.status == 201
        true
      else
        false
      end
    end

    protected
    def insightly_client
      HighriseInsightly.insightly_client
    end

    class << self
      def fetch(email, first_name = nil, last_name = nil)
        resp = nil
        if email
          resp = insightly_client.get('contacts', {
            email: email
          })
        else
          resp = insightly_client.get('contacts', {
            '$filter' => "FIRST_NAME eq '#{first_name}' " +
              "and LAST_NAME eq '#{last_name}'"
          })
        end

        if resp.status == 200
          new(resp.body[0])
        end
      end

      protected
      def insightly_client
        HighriseInsightly.insightly_client
      end
    end
  end
end
