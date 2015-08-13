require 'grape'
require 'json'
require_relative 'factories/repository_factory'
require_relative 'helpers/blog_api_helper'

module BlogPosts
  class API < Grape::API
    version 'v1', using: :header, vendor: 'TW'
    format :json
    prefix :api

    resource :blogPosts do
      repository = RepositoryFactory.create_repository

      post do
        sanitized_post =  BlogApiHelper.new.sanitize_html_in_post_content params

        repository.insert :blog_posts, sanitized_post
        return repository.all :blog_posts
      end

      params do
        requires :_id, type: String
      end

      get '/:_id' do
        repository.find_by_id :blog_posts, params["_id"]
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
