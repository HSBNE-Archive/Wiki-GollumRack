require 'sinatra/base'

configure do
  set :views, 'api/views'
end

class Api < Sinatra::Base
  get '/api/clone' do
    liquid :clone, :locals => { :env => ENV.to_hash }
  end
end
