require 'sinatra/base'

configure do
  mime_type :text, 'text/plain'
end

class Api < Sinatra::Base
  get '/api/heartbeat' do
    'True'
  end
  get '/api/scripts/clone' do
    content_type :text
    liquid :clone, :views => 'api/views', :locals => { :env => ENV.to_hash }
  end
end
