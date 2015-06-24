module InsightlyTestClient
  def insightly_connection(&block)
    @stubs ||= Faraday::Adapter::Test::Stubs.new
    @cnn ||= Faraday.new do |builder|
      builder.request :json
      builder.response :json
      builder.adapter :test, @stubs
    end

    block.call(@stubs)

    allow(HighriseInsightly).to receive(:insightly_client).
      and_return(@cnn)
  end
end

