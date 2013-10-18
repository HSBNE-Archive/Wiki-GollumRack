require "rubygems"
#require "omniauth"
Bundler.require(:default)

require "gollum/frontend/app"
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

Precious::App.set(:gollum_path, '/var/lib/openshift/51626b15e0b8cdc04d000251/git/gollum.git')
#Precious::App.set(:gollum_path, '.')
Precious::App.set(:wiki_options, {})
run Precious::App
