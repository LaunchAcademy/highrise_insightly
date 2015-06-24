require "insightly2"

require "highrise_insightly/contact"
require "highrise_insightly/highrise/note"
require "highrise_insightly/highrise/email"
require "highrise_insightly/highrise/file"

require "highrise_insightly/version"

module HighriseInsightly
  class << self
    def api_key
      ENV['INSIGHTLY_KEY']
    end
  end
end
