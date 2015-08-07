require_relative 'car'
require_relative 'comments'
require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post]
  end
end

run Car::API
run Comments::API
