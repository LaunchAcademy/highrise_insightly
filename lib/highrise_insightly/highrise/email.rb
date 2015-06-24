module HighriseInsightly
  module Highrise
    class Email < Note
      def subject
        @data["Subject"]
      end
    end
  end
end
