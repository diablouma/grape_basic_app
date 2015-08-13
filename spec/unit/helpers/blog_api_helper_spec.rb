require 'spec_helper'

describe BlogApiHelper do
  it "sanitizes a piece of HTML" do
    blog_api_helper = BlogApiHelper.new
    post = {"html" => "<div><h1>Title</h1></div><script>kill the app</script>"}
    new_post = blog_api_helper.sanitize_html_in_post_content post
    expect(new_post).to eq({"html" => "<div><h1>Title</h1></div>"})
  end
end
