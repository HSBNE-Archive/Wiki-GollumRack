require 'sinatra/base'

set :views, 'api/views'
configure do
  set :views, 'api/views'
  mime_type :text, 'text/plain'
end

class Api < Sinatra::Base
  get '/api/heartbeat' do
    'True'
  end
  get '/api/scripts/clone' do
    content_type :text
    liquid :clone, :locals => { :env => ENV.to_hash }
  end
end
