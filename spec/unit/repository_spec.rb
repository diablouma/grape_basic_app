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
    posts = repository.all_posts

    expect(posts).to eq expected_posts
  end
end
