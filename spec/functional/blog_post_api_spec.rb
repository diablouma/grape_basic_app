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

    describe 'POST /api/blog_posts' do
      it 'should save blog post content as sanitized html' do
        unsecure_html_content = 'ohai! <div>div is safe</div><script>but script is not</script>'

        post 'api/blog_posts', {'html' => unsecure_html_content}

        expect(last_response.status).to eq 201

        last_inserted_post = get_last_inserted_post()

        expect(last_inserted_post["html"]).to eq("ohai! <div>div is safe</div>")
      end
    end

    describe 'GET /api/blog_posts' do
      it 'should return a list of blog posts' do
        @repository.insert :blog_posts, {'html' => 'some content'}
        @repository.insert :blog_posts, {'html' => 'some other'}

        get 'api/blog_posts'

        posts = JSON.parse(last_response.body)

        expect(posts.length).to eq(2)
      end
    end

    describe 'GET /api/blog_posts/:_id' do
      it 'should return post by its key' do
        insert_unique_post_in_db()
        last_post_oid = get_last_inserted_post()["_id"]

        get 'api/blog_posts/' + last_post_oid
        blog_post = JSON.parse(last_response.body)

        expect(last_response.status).to eq(200)

        expect(BSON::ObjectId(blog_post["_id"]["$oid"])).to eq(last_post_oid)
      end
    end

    def get_last_inserted_post
      last_post_oid = @repository.all(:blog_posts)[0]
    end

    def insert_unique_post_in_db
      @repository.delete_all :blog_posts
      first_post = {"html" => "<b>some text in bold</b>"}
      @repository.insert :blog_posts, first_post
    end

    after :each do
      @repository.delete_all :comments
      @repository.delete_all :blog_posts
    end
  end
end
