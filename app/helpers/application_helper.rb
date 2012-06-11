module ApplicationHelper
  # Get the title of the app.
  def app_title
    "Working925"
  end

  # Set the title of the page.
  def title(page_title)
    content_for(:title) { page_title }
  end

  # Convert and wrap the specified markdown_text to "safe" HTML
  def markdown_to_html_safe(markdown_text)
    result = '<div class="markdown">' + RDiscount.new(markdown_text).to_html + '</div>'
    result.html_safe
  end

  # Show markdown description text with the specified intro_text (use before markdown input fields)
  def markdown_desc_text(intro_text)
    result = '<p><em>' + intro_text + ' using ' + link_to("markdown syntax", "http://daringfireball.net/projects/markdown/syntax") + '.</em></p>'
    result.html_safe
  end

end
