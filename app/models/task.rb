class Task < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessible :title, :desc, :status, :project

  belongs_to :project

  scope :status, proc { |status| where(:status => status) }

  before_validation :set_default_status

  validates :status, :presence => true, :inclusion => { :in => %w(idle progress done), :message => "%{value} is not a valid status" }

  private
  def set_default_status
    self.status = "idle"
  end

end

# == Schema Information
#
# Table name: tasks
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  desc       :text
#  project_id :integer
#  slug       :string(255)
#  status     :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

