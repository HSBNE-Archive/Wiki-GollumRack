require "rubygems"
require "omniauth"
Bundler.require(:default)

require 'gollum/app'
require 'omniauth/strategies/google_oauth2'
require "./api.rb"

options = {
  :providers => Proc.new do
    provider :google_oauth2, ENV['GOLLUM_AUTH_GOOGLE_CLIENTID'], ENV['GOLLUM_AUTH_GOOGLE_SECRET']
  end,
  :dummy_auth => false,
  :protected_routes => [
    '/members/*',
    '/revert/*',
    '/revert',
    '/create/*',
    '/create',
    '/edit/*',
    '/edit',
    '/rename/*',
    '/rename',
    '/delete/*',
    '/delete'
  ]
}

Precious::App.set(:omnigollum, options)

Precious::App.register Omnigollum::Sinatra

Precious::App.set(:gollum_path, ENV['GOLLUM_DATA_PATH'])

Precious::App.set(:wiki_options, {
  :live_preview => false
})

use Api
run Precious::App
