require 'spec_helper'

describe Repository do
  before :each do
    @collection = instance_double("posts_collection")
    @mongo_client = instance_double("mongo_client")
    allow(@mongo_client).to receive(:[]).and_return(@collection)
  end

  it "returns an array of posts" do
    repository = Repository.new @mongo_client
    posts = Enumerator.new {|g| g.yield Hash["title", "amazing post 1"];
                                g.yield Hash["title", "amazing post 2"]}
    allow(@collection).to receive(:find).and_return(posts)

    expected_posts = [{"title" => "amazing post 1"},
                      {"title" => "amazing post 2"}]
    posts = repository.all :posts

    expect(posts).to eq expected_posts
  end

  it "returns a post by its bson id" do
    repository = Repository.new @mongo_client
    post = Enumerator.new {|g| g.yield Hash["title", "amazing post 1"];}
    allow(@collection).to receive(:find).with(:_id=>BSON::ObjectId("4db2ebee90036f010b000001"))
                                              .and_return(post)

    expected_post = {"title" => "amazing post 1"}

    found_post = repository.find_by_id :blog_posts, "4db2ebee90036f010b000001"

    expect(found_post).to eq expected_post
  end
end
