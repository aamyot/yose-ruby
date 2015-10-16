require './app/yose'

describe 'Portfolio Challenge' do

  def app
    Yose.new
  end

  it 'links to a portfolio' do
    get '/'

    expect(last_response.body).to include('<a id="contact-me-link" href="http://ca.linkedin.com/in/alexandreamyot">Contact</a>')
    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('text/html')
  end

  it 'links to the ping challenge' do
    get '/'

    expect(last_response.body).to include('<a id="ping-challenge-link" href="/ping">Ping</a>')
    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('text/html')
  end

end
