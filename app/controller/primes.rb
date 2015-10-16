require './app/primes/prime_factors'
require './app/primes/results'
require 'json'

class Primes

  def call(env)
    request = Rack::Request.new(env)
    result = decompose(request.params['number'])

    [200, {'Content-Type' => 'application/json'}, [to_json(result)]]
  end

  def decompose(input)
    if !(Integer(input) rescue false)
      PrimeResults::NotANumber.new(input)
    elsif input.to_i > 1_000_000
      PrimeResults::NumberIsTooBig.new(input)
    else
      PrimeResults::Valid.new(input, PrimeFactors.of(input.to_i))
    end
  end

  def to_json(result)
    result.to_json
  end

end