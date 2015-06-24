$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'highrise_insightly'

require 'rspec'
require 'webmock/rspec'

require File.join(File.dirname(__FILE__), 'support/insightly_test_client')

RSpec.configure do |config|
  config.include InsightlyTestClient

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
