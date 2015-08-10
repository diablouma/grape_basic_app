require 'spec_helper'

describe Repository do
  before :each do
    @mongo_client = Mongo::Client.new(['127.0.0.1:27017'], database: 'blog_test')
    @repository = Repository.new @mongo_client
  end

  it "persists a document" do
    post = {"title" => "my post", "content" => "my content"}
    @repository.insert :posts, post

    inserted_post = @repository.all_posts[0]

    expect(inserted_post["title"]).to eq(post["title"])
    expect(inserted_post["content"]).to eq(post["content"])
  end

  after :each do
    @mongo_client[:posts].drop
  end
end
