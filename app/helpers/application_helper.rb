module ApplicationHelper
  # Get the title of the app.
  def app_title
    "Working925"
  end

  # Set the title of the page.
  def title(page_title)
    content_for(:title) { page_title }
  end

end
