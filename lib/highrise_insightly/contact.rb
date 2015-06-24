module HighriseInsightly
  class Contact
    class << self
      def fetch(email, first_name = nil, last_name = nil)
        if email
          insightly_client.get('contacts', {
            email: email
          })
        else
          insightly_client.get('contacts', {
            '$filter' => "FIRST_NAME eq '#{first_name}' " +
              "and LAST_NAME eq '#{last_name}'"
          })
        end
      end

      protected
      def insightly_client
        HighriseInsightly.insightly_client
      end
    end
  end
end
