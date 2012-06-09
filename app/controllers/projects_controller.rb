class ProjectsController < InheritedResources::Base
  respond_to :html, :xml, :json

  before_filter :authenticate_user!

  before_filter :ensure_correct_user!, :only => [ :show, :edit, :update, :destroy ]
  def create
    @project = Project.new(params[:project])
    @project.users << current_user

    create!
  end

  private

  def ensure_correct_user!
    @project = Project.find(params[:id])
    redirect_to(reports_path, :alert => "You may not perform this action!") and return unless @project.users.include? current_user
  end
end
