require 'sinatra/base'

class Api < Sinatra::Base

  configure do
    set :views, 'api/views'
    mime_type :text, 'text/plain'
  end

  get '/api/heartbeat' do
    'True'
  end

  get '/api/scripts/clone' do
    content_type :text
    'missing - I\'ve removed this pending setup on digital ocean vs openshift'
    #liquid :clone, :locals => { :env => ENV.to_hash }
  end

end
