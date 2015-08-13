require 'spec_helper'

describe HtmlSanitizer do

  before :each do
    @html_sanitizer = HtmlSanitizer.new
    @unsecure_html = "ohai! <div>div is safe</div><script>but script is not</script>"
  end

  it 'should call scrub fragment method with unsecure_html and :prune option' do
    expect(Loofah).to receive(:scrub_fragment).with(@unsecure_html, :prune)
    @html_sanitizer.sanitize(@unsecure_html)
  end

  it 'should return sanitized html' do
    sanitized_html = @html_sanitizer.sanitize(@unsecure_html)
    expect(sanitized_html).to eq("ohai! <div>div is safe</div>")
  end
end
