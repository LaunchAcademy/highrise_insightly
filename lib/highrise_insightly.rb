require "faraday"
require "faraday_middleware"

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

    def insightly_client
      Faraday.new(url: [host,path].join('/')) do |faraday|
        faraday.request  :url_encoded
        faraday.response :json
        faraday.basic_auth api_key, ''
        faraday.adapter Faraday.default_adapter
      end
    end

    protected
    def host
      'https://api.insight.ly'
    end

    def path
      'v2.1'
    end
  end
end
