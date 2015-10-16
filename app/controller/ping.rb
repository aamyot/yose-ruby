class Ping
  def call(env)
    ['200', {'Content-Type' => 'application/json'}, ['{ "alive" : true }']]
  end
end