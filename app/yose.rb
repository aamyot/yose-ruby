require './app/controller/home'
require './app/controller/ping'
require './app/controller/primes'

class Yose
  def initialize
    @app = Rack::Builder.new do
      use Rack::Static, :urls => ['/css'], :root => 'public'

      map '/' do
        run Home.new
      end

      map '/ping' do
        run Ping.new
      end

      map '/primeFactors' do
        run Primes.new
      end
    end
  end

  def call(env)
    @app.call(env)
  end
end