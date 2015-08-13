require 'loofah'

class HtmlContentSanitizer
  def sanitize unsecure_html
    fragment = Loofah.scrub_fragment(unsecure_html, :prune)
    return fragment.to_s
  end
end
