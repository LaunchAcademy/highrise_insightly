module HighriseInsightly
  class Contact < Insightly2::Resources::Contact
    class << self
      def fetch(email)
        insightly_client.get_contacts(email: @email).first
      end
    end

    protected
    def insightly_client
      Insightly.client
    end
  end
end
