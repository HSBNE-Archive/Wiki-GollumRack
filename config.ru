require "rubygems"
Bundler.require(:default)

require "gollum/frontend/app"

use Rack::Auth::Basic, "My wiki - authenticate!" do |username, password|
  [username, password] == ['wiki', 'wiki']
end

Precious::App.set(:gollum_path, '/var/lib/openshift/51626b15e0b8cdc04d000251/git/gollum.git')
Precious::App.set(:wiki_options, {})
run Precious::App
