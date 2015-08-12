require 'spec_helper'

describe Grape::API do
  include Rack::Test::Methods

  def app
    BlogPosts::API
  end

  describe BlogPosts::API do

    before :each do
      @repository = RepositoryFactory.create_repository
      @repository.delete_all :comments
    end

    describe 'GET /api/comments' do
      it 'should return an array of comments' do
        first_comment = {"key" => "1",
                         "author" => "Pete Hunt",
                         "text" => "This is one comment"}
        second_comment = {"key" => "2",
                          "author" => "Jordan Walke",
                          "text" => "This is *another* comment"}
        @repository.insert :comments, first_comment
        @repository.insert :comments, second_comment
        get 'api/comments'
        expect(last_response.status).to eq 200
        comments = JSON.parse(last_response.body)
        expect(comments.length).to eq(2)
      end
    end

    after :each do
      @repository.delete_all :comments
    end
  end
end
