module HighriseInsightly
  class Organization < Contact
    def initialize(attributes)
      @id = attributes["ORGANISATION_ID"]
    end

    class << self
      def fetch(name)
        resp = insightly_client.get('organisations', {
          '$filter' => "ORGANISATION_NAME eq '#{name}'"
        })

        resp.body[0].nil? ? nil : new(resp.body[0])
      end
    end

    protected
    def link_subject_type
      'ORGANISATION'
    end
  end
end
