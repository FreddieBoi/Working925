class Report < ActiveRecord::Base
  belongs_to :user

  attr_accessible :worked_on, :started_at, :left_at, :lunch_for, :away_for, :user

  validates :user, :presence => true

  validates :worked_on, :presence => true

  validates :started_at, :presence => true

  validates :left_at, :presence => true

  validates :lunch_for, :presence => true,
                        :numericality => { :only_integer => true }

  validates :away_for, :presence => true,
                        :numericality => { :only_integer => true }
                        
  before_save :check_time
  
  private
  
  def check_time
    valid_time = left_at > started_at
    self.errors.add_to_base("Time invalid! Left at < Started at") and return false unless valid_time
    work_time = 
    valid_time = (left_at-started_at)/60 > lunch_for+away_for
    self.errors.add_to_base("Time invalid! Non-working time larger than working time") and return false unless valid_time
  end

end
