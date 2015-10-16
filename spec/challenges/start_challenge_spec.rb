require './app/yose'

describe 'Start Challenge' do

  def app
    Yose.new
  end

  describe 'Home Page' do
    before(:each) do
      get '/'

      expect(last_response.status).to eq(200)
      expect(last_response.content_type).to eq('text/html')
    end

    it 'displays "Hello Yose"' do
      expect(last_response.body).to include('Hello Yose')
    end

    it 'links to its repository' do
      expect(last_response.body).to include('<a id="repository-link" href="http://github.com/aamyot/yose-ruby">Source</a>')
    end
  end

  it 'responds to a ping' do
    get '/ping'

    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('application/json')
    expect(last_response.body).to eq('{ "alive" : true }')
  end

end
