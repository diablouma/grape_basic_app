require 'grape'
require 'json'
require_relative 'persistence/mongo_client'

module Comments
  class API < Grape::API
    version 'v1', using: :header, vendor: 'TW'
    format :json
    prefix :api

    resource :comments do
      get do
        client = get_client()
        cursor = client[:comments].find()
        results = []

        cursor.each do |doc|
          results.push(doc)
        end

        return results
      end

      post do
        client = get_client()
        result = client[:comments].insert_one(params)
        client = get_client()
        cursor = client[:comments].find()
        results = []

        cursor.each do |doc|
          results.push(doc)
        end

        return results
      end
    end
  end
end
