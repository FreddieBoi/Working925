class Report < ActiveRecord::Base
  belongs_to :user

  attr_accessible :worked_on, :started_at, :left_at, :lunch_for, :away_for, :log, :user

  validates :user, :presence => true

  validates :worked_on, :presence => true

  validates :started_at, :presence => true

  validates :left_at, :presence => true

  validates :lunch_for, :presence => true,
                        :numericality => { :only_integer => true }

  validates :away_for, :presence => true,
                        :numericality => { :only_integer => true }

  before_save :check_time, :markup_links
  def worked_for_m
    (left_at-started_at)/60 - (lunch_for+away_for)
  end

  def worked_for_h
    worked_for_m/60
  end

  def worked_for_s
    "#{(worked_for_m/60).to_i} hours #{(worked_for_m%60).to_i} minutes"
  end

  private

  def check_time
    valid_time = left_at > started_at
    self.errors.add_to_base("Time invalid! Left at < Started at") and return false unless valid_time
    work_time =
    valid_time = (left_at-started_at)/60 > lunch_for+away_for
    self.errors.add_to_base("Time invalid! Non-working time larger than working time") and return false unless valid_time
  end

  def markup_links
    self.log.gsub!(/(^| ){1}(?:https?:\/\/|www\.)\S+( |$){1}/i) do |match|
      # Starts/ends with a whitespace? Add it to result (but not in the anchor)
      starts_with_whitespace = match.start_with? " "
      ends_with_whitespace = match.end_with? " "
      
      # Remove leading/trailing whitespaces
      match.strip!
      
      # Check if we accidentally matched a interpunctuation sign.
      interpunctuations = [".", "!", "?"]
      last = match.split("").last
      interpunctuation = last if interpunctuations.include? last
      
      # Ends with an interpunctuation? Add it to result (but not in the anchor)
      if interpunctuation
        # Remove it
        match[match.length-1] = ""
      end

      # Prepare the result
      result = ""
      # Add leading whitespace if any
      result += " " if starts_with_whitespace
      # Add the corrected match (wrapped in an anchor)
      result += '<a href="' + match + '">' + match + '</a>'
      # Add the interpunctuation if any
      result += interpunctuation if interpunctuation
      # Add trailing whitespace if any
      result += " " if ends_with_whitespace
    end
  end

end

# == Schema Information
#
# Table name: reports
#
#  id         :integer         not null, primary key
#  worked_on  :date            not null
#  started_at :time            default(2000-01-01 09:00:00 UTC), not null
#  left_at    :time            default(2000-01-01 17:00:00 UTC), not null
#  lunch_for  :integer         default(60), not null
#  away_for   :integer         default(0), not null
#  log        :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

