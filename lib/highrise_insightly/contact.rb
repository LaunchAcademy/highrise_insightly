module HighriseInsightly
  class Contact
    def initialize(attributes)
      @id = attributes["CONTACT_ID"]
    end

    def save_note(note)
      params = {
        'TITLE' => "Highrise Note Import",
        'BODY' => note.body,
        'LINK_SUBJECT_ID' => @id,
        'LINK_SUBJECT_TYPE' => 'CONTACT',
      }

      if note.written
        params['TITLE'] += " FROM #{note.written}"
        params['DATE_CREATED_UTC'] = note.written.utc.to_s.gsub(" UTC", "")
      end

      resp = insightly_client.post('Notes', params)

      resp.status == 201
    end

    def save_email(email)
      params = {
        'TITLE' => email.subject,
        'BODY' => email.body,
        'LINK_SUBJECT_ID' => @id,
        'LINK_SUBJECT_TYPE' => 'CONTACT',
      }

      if !email.written.nil?
        params['DATE_CREATED_UTC'] = email.written.utc.to_s.gsub(" UTC", "")
      end

      resp = insightly_client.post('Notes', params)

      resp.status == 201
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
          resp.body[0].nil? ? nil : new(resp.body[0])
        end
      end

      protected
      def insightly_client
        HighriseInsightly.insightly_client
      end
    end
  end
end
