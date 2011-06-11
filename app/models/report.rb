class Report < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :worked_on, :started_at, :left_at, :lunch_for, :user
  
  validates :user, :presence => true
  
end
