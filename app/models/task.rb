class Task < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :project
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
#  created_at :datetime
#  updated_at :datetime
#

