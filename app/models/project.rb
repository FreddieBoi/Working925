class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
end
# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  desc       :text
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

