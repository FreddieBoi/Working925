module TasksHelper
  # Pop a span showing the status (using correct style class)
  def status_span(status)
    result = '<span class="' + status + '">' + status.capitalize + '</span>'
    result.html_safe
  end
end
