require './app/yose'

describe 'Prime Factors Challenge' do

  def app
    Yose.new
  end

  it 'decomposes a power of 2 into factors' do
    get '/primeFactors?number=16'

    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('application/json')
    expect(last_response.body).to eq(
        '{' \
          '"number":16,' \
          '"decomposition":[2,2,2,2]' \
        '}')
  end

  it 'validates that the input is a number' do
    get '/primeFactors?number=NotANumber'

    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('application/json')
    expect(last_response.body).to eq(
        '{' \
          '"number":"NotANumber",' \
          '"error":"not a number"' \
        '}')
  end

  it 'decomposes a positive integer into prime factors' do
    get '/primeFactors?number=300'

    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('application/json')
    expect(last_response.body).to eq(
        '{' \
          '"number":300,' \
          '"decomposition":[2,2,3,5,5]' \
        '}')
  end

  it 'validates that the input is lower than 1 000 000' do
    get '/primeFactors/primeFactors?number=1000001'

    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('application/json')
    expect(last_response.body).to eq(
          '{' \
            '"number":1000001,' \
            '"error":"too big number (>1e6)"' \
          '}')
  end

  xit 'supports decomposition of multiple entries' do
    get '/primeFactors?number=300&number=120&number=hello&jean=guy'

    expect(last_response.status).to eq(200)
    expect(last_response.content_type).to eq('application/json')
    expect(last_response.body).to eq(
          '[' \
              '{' \
                  '"number" : 300,' \
                  '"decomposition" : [ 2, 2, 3, 5, 5 ]' \
              '},' \
              '{' \
                  '"number" : 120,' \
                  '"decomposition" : [ 2, 2, 2, 3, 5 ]' \
              '},' \
              '{' \
                  '"number" : "hello",' \
                  '"error" : "not a number"' \
              '},' \
          ']')
  end

end