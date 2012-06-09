class ReportsController < InheritedResources::Base
  respond_to :html, :xml, :json

  before_filter :authenticate_user!

  before_filter :ensure_correct_user!, :only => [ :show, :edit, :update, :destroy ]
  def index
    @date = params[:month] ? Date.parse(params[:month]+"-01") : Date.today
    @reports = []
    @total_h = 0.0
    @total_m = 0
    @overall_h = 0.0
    @overall_m = 0
    @overall_reports_count = 0
    Report.where(:user_id => current_user.id).each do |report|
      if report.worked_on.month == @date.month
        @reports << report
        @total_h += report.worked_for_h
        @total_m += report.worked_for_m
      end
      @overall_reports_count += 1
      @overall_h += report.worked_for_h
      @overall_m += report.worked_for_m
    end
    @total_s = "#{(@total_m/60).to_i} hours #{(@total_m%60).to_i} minutes"
    @overall_s = "#{(@overall_m/60).to_i} hours #{(@overall_m%60).to_i} minutes"
    @avg_reported = (@total_h / @reports.count).round(2)
    @overall_avg_reported = (@overall_h / @overall_reports_count).round(2)
    @total_h = @total_h.round(2)
    @overall_h = @overall_h.round(2)

    index!
  end

  def new
    if params[:worked_on]
      @report = Report.new(worked_on: params[:worked_on].to_date)
    end

    new!
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
