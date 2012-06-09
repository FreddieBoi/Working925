class TasksController < InheritedResources::Base
  respond_to :html, :xml, :json

  belongs_to :project

  before_filter :authenticate_user!

  before_filter :ensure_correct_user!, :only => [ :show, :edit, :update, :destroy ]

  has_scope :status

  private
  def ensure_correct_user!
    @task = Task.find(params[:id])
    redirect_to(reports_path, :alert => "You may not perform this action!") and return unless @task.project.users.include? current_user
  end
end
