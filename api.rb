require 'sinatra/base'

configure do
  set :views, 'api/views'
end

class Api < Sinatra::Base
  get '/api/heartbeat' do
    'True'
  end
  get '/api/scripts/clone' do
    liquid :clone, :locals => { :env => ENV.to_hash }
  end
end
