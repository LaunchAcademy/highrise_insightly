require 'yaml'

module HighriseInsightly
  module Highrise
    class File
      def initialize(path)
        @path = path
        begin
          @contents = YAML.load(::File.read(@path))
        rescue Psych::SyntaxError
          @contents = []
        end

        @data = @contents.inject({}) do |map, content|
          [
            "Name"
          ].each do |attribute|
            if !content[attribute].nil?
              map[attribute] = content[attribute]
            end
          end

          if content["Contact"]
            content["Contact"].each do |contact_array|
              if contact_array[0] == "Email_addresses"
                map["Email"] = contact_array[1]
              end
            end
          end

          map
        end
      end

      def name
        @data["Name"]
      end

      def email
        @data["Email"]
      end

      def notes
        if @notes.nil?
          @notes = []
          @contents.each do |content|
            if content.keys.size == 1 && content.keys[0].to_s =~ /\ANote/
              @notes << Note.new(content[content.keys.first])
            end
          end
        end
        @notes
      end

      def emails
        if @emails.nil?
          @emails = []
          @contents.each do |content|
            if content.keys.size == 1 && content.keys[0].to_s =~ /\AEmail/
              @emails << Email.new(content[content.keys.first])
            end
          end
        end
        @emails
      end

      protected
      def header
        @contents.first
      end
    end
  end
end
