require 'net/http'
require 'uri'

class HttpRequest

  def initialize(port)
    @port = port
    @host = '0.0.0.0'
  end

  def get(path)
    http = Net::HTTP.new(@host, @port)
    request = Net::HTTP::Get.new(path)

    response = http.request(request)
  end

end