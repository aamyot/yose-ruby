require 'thin'

class YoseLauncher

  def self.start(port)
    Thin::Logging.level= Logger::ERROR

    server = Thin::Server.new('0.0.0.0', port, Yose.new)
    Thread.new { server.start }

    sleep(0.1) until server.running?

    server
  end

end