require 'bundler'
require './api'
require 'rack/cors'

Bundler.require

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :get
  end
end

run GrapeLand::Api