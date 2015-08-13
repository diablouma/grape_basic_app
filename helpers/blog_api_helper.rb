require './security/html_content_sanitizer'

class BlogApiHelper
  def initialize
    @html_sanitizer = HtmlContentSanitizer.new
  end

  def sanitize_html_in_post_content request_params
    post_to_insert = request_params
    return replace_with_secure_html post_to_insert
  end

  def replace_with_secure_html post_to_insert
    sanitized_html = @html_sanitizer.sanitize(post_to_insert["data"]["html"])
    post_to_insert["html"] = sanitized_html
    return post_to_insert
  end
end
