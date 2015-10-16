require './app/view/views'

class Home
  def call(env)
    [200, {'Content-Type' => 'text/html'}, [View::Home.render]]
  end
end