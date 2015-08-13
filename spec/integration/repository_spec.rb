require 'spec_helper'

describe Repository do
  before :each do
    mongo_host = '127.0.0.1:27017'
    db_name = 'blog_test'
    @mongo_client = Mongo::Client.new [mongo_host], database: db_name
    @repository = Repository.new @mongo_client
  end

  it "persists a document" do
    post = {"title" => "my post", "content" => "my content"}

    @repository.insert :posts, post
    posts = @repository.all :posts
    inserted_post = posts[0]

    expect(inserted_post["title"]).to eq(post["title"])
    expect(inserted_post["content"]).to eq(post["content"])
  end

  it "deletes all documents in a collection" do
    post = {"title"=> "some title", "content"=> "some content"}
    @repository.insert :posts, post

    @repository.delete_all :posts
    documents = @repository.all :posts

    expect(documents).to be_empty
  end

  it "returns a post by its bson id" do
    @repository.delete_all :posts
    post = {"title"=> "some title", "content"=> "some content"}
    @repository.insert :posts, post
    all_post = @repository.all :posts
    inserted_post_oid = all_post[0]["_id"]

    found_post = @repository.find_by_id :posts, inserted_post_oid.to_s

    expect(found_post["_id"]).to eq inserted_post_oid
  end

  after :each do
    @mongo_client[:posts].drop
  end
end
