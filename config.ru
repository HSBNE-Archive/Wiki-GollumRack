require "rubygems"
#require "omniauth"
Bundler.require(:default)

require "gollum/frontend/app"
require "./api.rb"
require "pry-remote"
#require 'omniauth/strategies/twitter'
#require 'omniauth/strategies/open_id'

#options = {
#  # OmniAuth::Builder block is passed as a proc
#  :providers => Proc.new do
#    #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
#    #provider :open_id, OpenID::Store::Filesystem.new('/tmp')
#  end,
#  :dummy_auth => false
#}

# :omnigollum options *must* be set before the Omnigollum extension is registered
#Precious::App.set(:omnigollum, options)

#Precious::App.register Omnigollum::Sinatra

#use Rack::Auth::Basic, "My wiki - authenticate!" do |username, password|
  #[username, password] == ['wiki', 'wiki']
#end

if ENV.has_key? 'OPENSHIFT_APP_NAME'
  Precious::App.set(:gollum_path, ENV['GOLLUM_DATA_PATH'])
else
  Precious::App.set(:gollum_path, '../gollum-data')
end

Precious::App.set(:wiki_options, {})

use Api
run Precious::App
