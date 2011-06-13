class ReportsController < ApplicationController
  
  before_filter :authenticate_user!
  
  before_filter :ensure_correct_user!, :only => [ :show, :edit, :update, :destroy ]
  
  # GET /reports
  # GET /reports.xml
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

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.xml
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.xml
  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.xml
  def create
    @report = Report.new(params[:report])
    @report.user = current_user

    respond_to do |format|
      if @report.save
        format.html { redirect_to(@report, :notice => 'Report was successfully created.') }
        format.xml  { render :xml => @report, :status => :created, :location => @report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to(@report, :notice => 'Report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end
  
  private

  def ensure_correct_user!
    @report = Report.find(params[:id])
    redirect_to(reports_path, :alert => "You may not perform this action!") and return unless current_user == @report.user
  end
end
