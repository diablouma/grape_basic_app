require 'grape'
require 'json'
require_relative 'factories/repository_factory'

module BlogPosts
  class API < Grape::API
    version 'v1', using: :header, vendor: 'TW'
    format :json
    prefix :api

    resource :blogPosts do
      post do
        repository = RepositoryFactory.create_repository
        repository.insert :blog_posts, params
        return repository.all :blog_posts
      end

      get do
        repository = RepositoryFactory.create_repository
        return repository.get_last :blog_posts
      end
    end

    resource :comments do
      get do
        repository = RepositoryFactory.create_repository
        return repository.all :comments
      end

      post do
        repository = RepositoryFactory.create_repository
        repository.insert :comments, params
        return repository.all :comments
      end
    end
  end
end
