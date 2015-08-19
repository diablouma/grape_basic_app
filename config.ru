require_relative 'blog_post'
require 'rack/cors'

use Rack::Static, :urls => ["/media"]

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post]
  end
end

run BlogPosts::API
