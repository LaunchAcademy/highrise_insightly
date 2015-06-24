require 'chronic'

module HighriseInsightly
  module Highrise
    class Note
      def initialize(data)
        @data = data.inject({}) do |map, key_value_pair|
          map[key_value_pair.keys[0]] = key_value_pair.values[0]
          map
        end
      end

      def author
        @data["Author"]
      end

      def about
        @data["About"]
      end

      def body
        @data["Body"]
      end

      def written
        @written ||= Chronic.parse(@data["Written"])
      end
    end
  end
end
