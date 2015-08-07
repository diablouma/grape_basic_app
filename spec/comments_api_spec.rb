require 'spec_helper'

describe Grape::API do
  include Rack::Test::Methods

  def app
    Comments::API
  end

  describe Comments::API do
    describe 'GET /api/comments' do
      it 'should return an array of comments' do
        get 'api/comments'
        expect(last_response.status).to eq 200
        expect(JSON.parse(last_response.body)).to eq [
          {"key"=>"1", "author"=> "Pete Hunt", "text"=> "This is one comment"},
          {"key"=>"2", "author"=> "Jordan Walke", "text"=> "This is *another* comment"}
        ]
      end
    end
  end
end
