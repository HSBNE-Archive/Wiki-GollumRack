require 'sinatra/base'

class Api < Sinatra::Base
  set :sessions, true
  set :foo, 'bar'

  get '/api/test' do
    'Hello world!'
  end
end
