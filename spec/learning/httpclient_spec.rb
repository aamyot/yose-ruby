require './app/yose'

require 'utils/yose_launcher'
require 'utils/http_request'

describe 'HTTPClient' do

  before(:each) do
    @server = YoseLauncher.start(3000)
  end

  after(:each) do
    @server.stop
  end

  it 'sends a http request' do
    response = HttpRequest.new(3000).get('/')

    expect(response.code).to eq("200")
    expect(response['Content-Type']).to eq('text/html')
  end

end