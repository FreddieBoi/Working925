class ReportsController < InheritedResources::Base
  respond_to :html, :xml, :json

  before_filter :authenticate_user!

  before_filter :ensure_correct_user!, :only => [ :show, :edit, :update, :destroy ]
  
  def index
    @date = params[:month] ? Date.parse(params[:month]+"-01") : Date.today
    @reports = []
    @total_h = 0.0
    @total_m = 0
    Report.where(:user_id => current_user.id).each do |report|
      if report.worked_on.month == @date.month
        @reports << report
        @total_h += report.worked_for_h
        @total_m += report.worked_for_m
      end
    end
    @total_s = "#{(@total_m/60).to_i} hours #{(@total_m%60).to_i} minutes"

    index!
  end

  def create
    @report = Report.new(params[:report])
    @report.user = current_user

    create!
  end

  private

  def ensure_correct_user!
    @report = Report.find(params[:id])
    redirect_to(reports_path, :alert => "You may not perform this action!") and return unless current_user == @report.user
  end
end
