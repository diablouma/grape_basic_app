require 'spec_helper'

describe Grape::API do
  include Rack::Test::Methods

  def app
    Car::API
  end

  describe Car::API do
    describe 'GET /api/cars/car' do
      it 'says hola mundo' do
        get 'api/cars/car'
        expect(last_response.status).to eq 200
        expect(last_response.body).to eq "1"
      end
    end
  end
end
