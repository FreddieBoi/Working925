class ApplicationController < ActionController::Base
  protect_from_forgery

  # Only render standard request
  before_filter :allow_only_standard_requests

  private
  # Only render standard request (eg. ignore reports/1.lolcat). Allow html, js, json, xml, rss. Render 404 if not allowed.
  def allow_only_standard_requests
    if params[:format] && (["html", "js", "json", "xml", "rss"].exclude?(params[:format]))
      raise ActionController::RoutingError.new('No route matches "'+request.url+'"')
    end
  end
end
