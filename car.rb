require 'grape'
require 'json'
require_relative 'persistence/mongo_client'

module Car
  class API < Grape::API
    version 'v1', using: :header, vendor: 'TW'
    format :json
    prefix :api

    resource :cars do
      get :car do
        client = get_client()
        result = client[:cars].insert_one({marca: 'chevrolet'})
        result.n
      end

      get do
        return [
          {key:"1", author: "Pete Hunt", text: "This is one comment"},
          {key:"2", author: "Jordan Walke", text: "This is *another* comment"}
        ]
      end
    end
  end
end
