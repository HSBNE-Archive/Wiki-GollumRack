require "rubygems"

Bundler.require(:default)

require 'omnigollum'
require 'omniauth'
require 'omniauth/strategies/google_oauth2'

require 'gollum/app'
require './views/layout'

options = {
  :providers => Proc.new do
    provider :google_oauth2, ENV['GOLLUM_AUTH_GOOGLE_CLIENTID'], ENV['GOLLUM_AUTH_GOOGLE_SECRET']
  end,
  :dummy_auth => false,
  :protected_routes => [
    '/Members/*',
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
  :live_preview => false,
  :css => true,
  :allow_editing => true,
})

Precious::App.settings.mustache[:templates] = './templates'

run Precious::App
