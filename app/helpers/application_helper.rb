module ApplicationHelper
  def app_title
    "Working925"
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

end
